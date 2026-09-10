local config = require 'config'

local sellableSet = {}
for i = 1, #config.sellableItems do
    sellableSet[config.sellableItems[i]] = true
end

lib.callback.register('fg_drugdeal:server:getSellableItems', function(source)
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

local function getDistanceBetween(sourceA, sourceB)
    local pedA = GetPlayerPed(sourceA)
    local pedB = GetPlayerPed(sourceB)
    if not pedA or pedA == 0 or not pedB or pedB == 0 then return math.huge end

    return #(GetEntityCoords(pedA) - GetEntityCoords(pedB))
end

RegisterNetEvent('fg_drugdeal:server:proposeDeal', function(targetId, itemName, quantity, price)
    local sellerId = source

    local seller = exports.qbx_core:GetPlayer(sellerId)
    if not seller or seller.PlayerData.job.name ~= 'thief' then return end

    quantity = math.floor(tonumber(quantity) or 0)
    price = math.floor(tonumber(price) or 0)

    if quantity <= 0 or price <= 0 then return end
    if not sellableSet[itemName] then return end
    if not GetPlayerName(targetId) then return end
    if targetId == sellerId then return end

    if getDistanceBetween(sellerId, targetId) > config.maxDealDistance then
        exports.qbx_core:Notify(sellerId, locale('error.too_far_away'), 'error')
        return
    end

    local sellerCount = exports.ox_inventory:Search(sellerId, 'count', itemName)
    if sellerCount < quantity then
        exports.qbx_core:Notify(sellerId, locale('error.dont_have_enough'), 'error')
        return
    end

    local sellerName = GetPlayerName(sellerId)
    local itemLabel = exports.ox_inventory:Items()[itemName].label

    local accepted = lib.callback.await('fg_drugdeal:client:receiveOffer', targetId, sellerName, itemLabel, quantity, price)

    if not accepted then
        exports.qbx_core:Notify(sellerId, locale('error.offer_declined'), 'error')
        return
    end

    -- Re-validate everything server-side; state may have changed while waiting on the offer
    if getDistanceBetween(sellerId, targetId) > config.maxDealDistance then
        exports.qbx_core:Notify(sellerId, locale('error.too_far_away'), 'error')
        exports.qbx_core:Notify(targetId, locale('error.too_far_away'), 'error')
        return
    end

    sellerCount = exports.ox_inventory:Search(sellerId, 'count', itemName)
    if sellerCount < quantity then
        exports.qbx_core:Notify(targetId, locale('error.seller_no_longer_has_item'), 'error')
        return
    end

    if not exports.ox_inventory:RemoveItem(sellerId, itemName, quantity) then return end

    local buyerPlayer = exports.qbx_core:GetPlayer(targetId)
    if not buyerPlayer or not buyerPlayer.Functions.RemoveMoney('cash', price, 'drug-deal-buy') then
        exports.ox_inventory:AddItem(sellerId, itemName, quantity) -- refund seller, deal failed
        exports.qbx_core:Notify(sellerId, locale('error.buyer_cant_afford'), 'error')
        exports.qbx_core:Notify(targetId, locale('error.you_cant_afford'), 'error')
        return
    end

    exports.ox_inventory:AddItem(targetId, itemName, quantity)
    exports.ox_inventory:AddItem(sellerId, config.payoutCurrency, price)

    exports.qbx_core:Notify(sellerId, locale('success.deal_completed_seller', quantity, itemLabel, price), 'success')
    exports.qbx_core:Notify(targetId, locale('success.deal_completed_buyer', quantity, itemLabel, price), 'success')
end)
