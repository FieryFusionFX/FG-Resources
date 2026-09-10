local config = require 'config'

local sellableSet = {}
for i = 1, #config.sellableItems do
    sellableSet[config.sellableItems[i]] = true
end

local undercoverIndex = nil

CreateThread(function()
    while true do
        undercoverIndex = math.random(1, #config.locations)
        Wait(config.undercoverRotateInterval)
    end
end)

lib.callback.register('fg_drugnpc:server:getSellableItems', function(source)
    local items = {}
    for i = 1, #config.sellableItems do
        local name = config.sellableItems[i]
        local count = exports.ox_inventory:Search(source, 'count', name)
        if count > 0 then
            items[#items + 1] = { name = name, label = exports.ox_inventory:Items()[name].label, count = count }
        end
    end
    return items
end)

lib.callback.register('fg_drugnpc:server:sellItem', function(source, itemName, quantity, locationIndex)
    local player = exports.qbx_core:GetPlayer(source)
    if not player or player.PlayerData.job.name ~= 'thief' then
        return { success = false, error = 'error.invalid_sale' }
    end

    quantity = math.floor(tonumber(quantity) or 0)

    if quantity <= 0 or not sellableSet[itemName] then
        return { success = false, error = 'error.invalid_sale' }
    end

    local priceRange = config.prices[itemName]
    if not priceRange then
        return { success = false, error = 'error.invalid_sale' }
    end

    local count = exports.ox_inventory:Search(source, 'count', itemName)
    if count < quantity then
        return { success = false, error = 'error.dont_have_enough' }
    end

    if not exports.ox_inventory:RemoveItem(source, itemName, quantity) then
        return { success = false, error = 'error.invalid_sale' }
    end

    local total = 0
    for _ = 1, quantity do
        total += math.random(priceRange.min, priceRange.max)
    end

    exports.ox_inventory:AddItem(source, config.payoutCurrency, total)

    -- Selling to the (secret, hourly-rotating) undercover dealer always calls it in, same payout otherwise
    local isUndercover = locationIndex ~= nil and locationIndex == undercoverIndex
    if isUndercover or config.policeCallChance >= math.random(1, 100) then
        TriggerEvent('police:server:policeAlert', locale('info.possible_drug_dealing'), nil, source)
    end

    return { success = true, amount = quantity, label = exports.ox_inventory:Items()[itemName].label, total = total }
end)
