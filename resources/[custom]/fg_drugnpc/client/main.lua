local config = require 'config'

local pedHandles = {}
local blipHandles = {}
local spawned = false

local function isThief()
    return table.type(QBX.PlayerData) ~= 'empty' and QBX.PlayerData.job.name == 'thief'
end

local function sellToDealer(locationIndex)
    local items = lib.callback.await('fg_drugnpc:server:getSellableItems', false)
    if not items or #items == 0 then
        return exports.qbx_core:Notify(locale('error.nothing_to_sell'), 'error')
    end

    local options = {}
    for i = 1, #items do
        options[#options + 1] = { value = items[i].name, label = ('%s (x%s)'):format(items[i].label, items[i].count) }
    end

    local input = lib.inputDialog(locale('text.sell_header'), {
        { type = 'select', label = locale('text.item_label'), options = options, required = true },
        { type = 'number', label = locale('text.quantity_label'), min = 1, required = true },
    })

    if not input then return end

    local result = lib.callback.await('fg_drugnpc:server:sellItem', false, input[1], math.floor(input[2]), locationIndex)
    if not result then return end

    if result.success then
        exports.qbx_core:Notify(locale('success.sold', result.amount, result.label, result.total), 'success')
    else
        exports.qbx_core:Notify(locale(result.error), 'error')
    end
end

local function despawnDealers()
    if not spawned then return end
    spawned = false

    for i = 1, #pedHandles do
        if DoesEntityExist(pedHandles[i]) then
            DeleteEntity(pedHandles[i])
        end
    end
    pedHandles = {}

    for i = 1, #blipHandles do
        RemoveBlip(blipHandles[i])
    end
    blipHandles = {}
end

local function spawnDealers()
    if spawned then return end
    spawned = true

    for i = 1, #config.locations do
        local location = config.locations[i]
        local coords = location.coords
        local model = location.model or config.ped.model
        local locationIndex = i

        lib.requestModel(model, 5000)

        local ped = CreatePed(0, model, coords.x, coords.y, coords.z, coords.w, false, false)
        FreezeEntityPosition(ped, true)
        SetEntityInvincible(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        TaskStartScenarioInPlace(ped, config.ped.scenario, 0, true)
        SetModelAsNoLongerNeeded(model)
        pedHandles[#pedHandles + 1] = ped

        local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
        SetBlipSprite(blip, config.blip.sprite)
        SetBlipColour(blip, config.blip.colour)
        SetBlipScale(blip, config.blip.scale)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString(locale('text.blip_name'))
        EndTextCommandSetBlipName(blip)
        blipHandles[#blipHandles + 1] = blip

        exports.ox_target:addLocalEntity(ped, {
            {
                name = 'fg_drugnpc_sell_' .. i,
                icon = 'fa-solid fa-cash-register',
                label = locale('text.target_label'),
                distance = config.interactionDistance,
                onSelect = function() sellToDealer(locationIndex) end,
            },
        })
    end
end

local function updateDealers()
    if isThief() then
        spawnDealers()
    else
        despawnDealers()
    end
end

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', updateDealers)
RegisterNetEvent('QBCore:Player:SetPlayerData', updateDealers)
RegisterNetEvent('QBCore:Client:OnPlayerUnload', despawnDealers)

CreateThread(function()
    while table.type(QBX.PlayerData) == 'empty' do Wait(100) end
    updateDealers()
end)

AddEventHandler('onResourceStop', function(resourceName)
    if resourceName ~= cache.resource then return end
    despawnDealers()
end)
