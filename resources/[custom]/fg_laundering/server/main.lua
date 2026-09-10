local config = require 'config'

local pendingLaunders = {} -- [source] = amount

lib.callback.register('fg_laundering:server:takeDirtyMoney', function(source, amount)
    local player = exports.qbx_core:GetPlayer(source)
    if not player or player.PlayerData.job.name ~= 'thief' then return false end

    amount = math.floor(tonumber(amount) or 0)
    if amount <= 0 or pendingLaunders[source] then return false end

    local dirtyCount = exports.ox_inventory:Search(source, 'count', config.dirtyMoneyItem)
    if dirtyCount < amount then
        exports.qbx_core:Notify(source, locale('error.not_enough_dirty_money'), 'error')
        return false
    end

    if not exports.ox_inventory:RemoveItem(source, config.dirtyMoneyItem, amount) then return false end

    pendingLaunders[source] = amount
    return true
end)

RegisterNetEvent('fg_laundering:server:finishLaunder', function(amount)
    local src = source
    amount = math.floor(tonumber(amount) or 0)

    if pendingLaunders[src] ~= amount then return end
    pendingLaunders[src] = nil

    local player = exports.qbx_core:GetPlayer(src)
    if not player then return end

    local cleanAmount = math.floor(amount * (1 - config.cutPercent))
    player.Functions.AddMoney('cash', cleanAmount, 'laundered-money')

    exports.qbx_core:Notify(src, locale('success.laundered', amount, cleanAmount, math.floor(config.cutPercent * 100)), 'success')
end)

AddEventHandler('playerDropped', function()
    pendingLaunders[source] = nil
end)
