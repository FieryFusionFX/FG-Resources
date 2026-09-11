local config = require 'config'

local isCooking = false
local labBlips = {}

local function isThief()
    return table.type(QBX.PlayerData) ~= 'empty' and QBX.PlayerData.job.name == 'thief'
end

local function removeLabBlips()
    for i = 1, #labBlips do
        RemoveBlip(labBlips[i])
    end
    labBlips = {}
end

local function updateLabBlips()
    if not isThief() then return removeLabBlips() end
    if #labBlips > 0 then return end

    for i = 1, #config.labs do
        local lab = config.labs[i]
        if lab.blipSprite then
            local coords = lab.coords
            local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
            SetBlipSprite(blip, lab.blipSprite)
            SetBlipColour(blip, config.blip.colour)
            SetBlipScale(blip, config.blip.scale)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName('STRING')
            AddTextComponentString(lab.blipName)
            EndTextCommandSetBlipName(blip)
            labBlips[#labBlips + 1] = blip
        end
    end
end

local function startCook(recipeKey, quantity)
    if not isThief() then
        return exports.qbx_core:Notify(locale('error.not_thief'), 'error')
    end

    if isCooking then
        return exports.qbx_core:Notify(locale('error.already_cooking'), 'error')
    end

    local recipe = config.recipes[recipeKey]
    local took = lib.callback.await('fg_druglab:server:takeIngredients', false, recipeKey, quantity)
    if not took then
        return exports.qbx_core:Notify(locale('error.missing_ingredients'), 'error')
    end

    isCooking = true

    local success = lib.progressBar({
        duration = math.min(recipe.cookTime * quantity, config.maxCookTime),
        label = ('%s x%s'):format(recipe.label, quantity),
        useWhileDead = false,
        canCancel = false,
        disable = { move = true, car = true, combat = true },
    })

    isCooking = false

    if success then
        TriggerServerEvent('fg_druglab:server:finishCook', recipeKey, quantity)
    end
end

local function openLabMenu(labIndex)
    local lab = config.labs[labIndex]

    local options = {}
    for i = 1, #lab.recipes do
        local key = lab.recipes[i]
        options[#options + 1] = { value = key, label = config.recipes[key].label }
    end

    local input = lib.inputDialog(locale('text.lab_header'), {
        { type = 'select', label = locale('text.recipe_label'), options = options, required = true },
    })

    if not input then return end

    local recipeKey = input[1]
    local recipe = config.recipes[recipeKey]

    local qtyInput = lib.inputDialog(recipe.label, {
        { type = 'number', label = locale('text.quantity_label'), min = 1, default = 1, required = true },
    })

    if not qtyInput then return end

    startCook(recipeKey, math.floor(qtyInput[1]))
end

for i = 1, #config.labs do
    local lab = config.labs[i]
    local coords = lab.coords
    local labIndex = i

    lib.points.new({
        coords = coords.xyz,
        distance = 10.0,
        nearby = function(self)
            if not isThief() then return end
            if self.currentDistance > config.interactionDistance then return end

            qbx.drawText3d({ text = locale('text.interact_prompt'), coords = coords.xyz + vec3(0, 0, 1.3) })

            if IsControlJustPressed(0, 38) then
                openLabMenu(labIndex)
            end
        end,
    })
end

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', updateLabBlips)
RegisterNetEvent('QBCore:Player:SetPlayerData', updateLabBlips)
RegisterNetEvent('QBCore:Client:OnPlayerUnload', removeLabBlips)

CreateThread(function()
    while table.type(QBX.PlayerData) == 'empty' do Wait(100) end
    updateLabBlips()
end)
