local config = require 'config'

RegisterNetEvent('fg_drugdeal:client:startDeal', function()
    if table.type(QBX.PlayerData) == 'empty' or QBX.PlayerData.job.name ~= 'thief' then
        return exports.qbx_core:Notify(locale('error.not_thief'), 'error')
    end

    local coords = GetEntityCoords(cache.ped)
    local targetPlayerId = lib.getClosestPlayer(coords, config.maxDealDistance)
    if not targetPlayerId then
        return exports.qbx_core:Notify(locale('error.no_one_nearby'), 'error')
    end

    local targetServerId = GetPlayerServerId(targetPlayerId)

    local items = lib.callback.await('fg_drugdeal:server:getSellableItems', false)
    if not items or #items == 0 then
        return exports.qbx_core:Notify(locale('error.nothing_to_sell'), 'error')
    end

    local options = {}
    for i = 1, #items do
        options[#options + 1] = { value = items[i].name, label = ('%s (x%s)'):format(items[i].label, items[i].count) }
    end

    local input = lib.inputDialog(locale('text.deal_header'), {
        { type = 'select', label = locale('text.item_label'), options = options, required = true },
        { type = 'number', label = locale('text.quantity_label'), min = 1, required = true },
        { type = 'number', label = locale('text.price_label'), min = 1, required = true },
    })

    if not input then return end

    TriggerServerEvent('fg_drugdeal:server:proposeDeal', targetServerId, input[1], input[2], input[3])
end)

lib.callback.register('fg_drugdeal:client:receiveOffer', function(sellerName, itemLabel, quantity, price)
    local result = lib.alertDialog({
        header = locale('text.offer_header'),
        content = locale('text.offer_content', sellerName, quantity, itemLabel, price),
        centered = true,
        cancel = true,
    })

    return result == 'confirm'
end)
