local config = require 'config'

local isLaundering = false
local blips = {}

local function isThief()
    return table.type(QBX.PlayerData) ~= 'empty' and QBX.PlayerData.job.name == 'thief'
end

local function removeBlips()
    for i = 1, #blips do
        RemoveBlip(blips[i])
    end
    blips = {}
end

local function updateBlips()
    if not isThief() then return removeBlips() end
    if #blips > 0 then return end

    for i = 1, #config.locations do
        local loc = config.locations[i]

        local blip = AddBlipForCoord(loc.x, loc.y, loc.z)
        SetBlipSprite(blip, 434) -- DollarSignSquared - distinct from the bank's plain $ (108) and pawnshop's circled $ (431)
        SetBlipColour(blip, 15) -- Dark green - deliberately darker/muted than the bank's bright green (2), signals "not a legit bank"
        SetBlipScale(blip, 0.8)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString('Money Laundering')
        EndTextCommandSetBlipName(blip)
        blips[#blips + 1] = blip
    end
end

local function openLaunderMenu()
    if not isThief() then
        return exports.qbx_core:Notify(locale('error.not_thief'), 'error')
    end

    if isLaundering then
        return exports.qbx_core:Notify(locale('error.already_laundering'), 'error')
    end

    local dirtyAmount = exports.ox_inventory:Search('count', config.dirtyMoneyItem)
    if dirtyAmount <= 0 then
        return exports.qbx_core:Notify(locale('error.no_dirty_money'), 'error')
    end

    local input = lib.inputDialog(locale('text.amount_label'), {
        {
            type = 'number',
            label = locale('text.amount_label'),
            description = ('%s (max %s)'):format(locale('text.amount_description'), dirtyAmount),
            min = 1,
            max = dirtyAmount,
            required = true,
        },
    })

    if not input then return end

    local amount = math.floor(input[1])
    if amount <= 0 then
        return exports.qbx_core:Notify(locale('error.invalid_amount'), 'error')
    end

    local took = lib.callback.await('fg_laundering:server:takeDirtyMoney', false, amount)
    if not took then return end

    isLaundering = true

    local success = lib.progressBar({
        duration = config.launderTimeMs,
        label = locale('text.laundering'),
        useWhileDead = false,
        canCancel = false,
        disable = { move = true, car = true, combat = true },
    })

    isLaundering = false

    if success then
        TriggerServerEvent('fg_laundering:server:finishLaunder', amount)
    end
end

for i = 1, #config.locations do
    local loc = config.locations[i]

    lib.points.new({
        coords = loc,
        distance = 10.0,
        nearby = function(self)
            if not isThief() then return end
            if self.currentDistance > config.interactionDistance then return end

            qbx.drawText3d({ text = locale('text.interact_prompt'), coords = loc + vec3(0, 0, 1.7) })

            if IsControlJustPressed(0, 38) then
                openLaunderMenu()
            end
        end,
    })
end

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', updateBlips)
RegisterNetEvent('QBCore:Player:SetPlayerData', updateBlips)
RegisterNetEvent('QBCore:Client:OnPlayerUnload', removeBlips)

CreateThread(function()
    while table.type(QBX.PlayerData) == 'empty' do Wait(100) end
    updateBlips()
end)
