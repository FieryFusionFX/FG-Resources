local config = require 'config'

local pendingCooks = {} -- [source] = recipeKey

lib.callback.register('fg_druglab:server:takeIngredients', function(source, recipeKey)
    local player = exports.qbx_core:GetPlayer(source)
    if not player or player.PlayerData.job.name ~= 'thief' then return false end

    local recipe = config.recipes[recipeKey]
    if not recipe or pendingCooks[source] then return false end

    for i = 1, #recipe.ingredients do
        local ingredient = recipe.ingredients[i]
        if exports.ox_inventory:Search(source, 'count', ingredient.item) < ingredient.amount then
            return false
        end
    end

    for i = 1, #recipe.ingredients do
        local ingredient = recipe.ingredients[i]
        exports.ox_inventory:RemoveItem(source, ingredient.item, ingredient.amount)
    end

    pendingCooks[source] = recipeKey
    return true
end)

RegisterNetEvent('fg_druglab:server:finishCook', function(recipeKey)
    local source = source
    if pendingCooks[source] ~= recipeKey then return end
    pendingCooks[source] = nil

    local recipe = config.recipes[recipeKey]
    if not recipe then return end

    exports.ox_inventory:AddItem(source, recipe.output.item, recipe.output.amount)
    exports.qbx_core:Notify(source, locale('success.cook_complete', recipe.output.amount, exports.ox_inventory:Items()[recipe.output.item].label), 'success')
end)

AddEventHandler('playerDropped', function()
    pendingCooks[source] = nil
end)
