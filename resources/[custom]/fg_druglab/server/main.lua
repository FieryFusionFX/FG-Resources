local config = require 'config'

local pendingCooks = {} -- [source] = { key = recipeKey, quantity = quantity }

lib.callback.register('fg_druglab:server:takeIngredients', function(source, recipeKey, quantity)
    local player = exports.qbx_core:GetPlayer(source)
    if not player or player.PlayerData.job.name ~= 'thief' then return false end

    local recipe = config.recipes[recipeKey]
    if not recipe or pendingCooks[source] then return false end

    -- never trust the client's quantity - recompute the cap server-side
    local maxQuantity = math.floor(config.maxCookTime / recipe.cookTime)
    quantity = math.floor(tonumber(quantity) or 0)
    if quantity < 1 or quantity > maxQuantity then return false end

    for i = 1, #recipe.ingredients do
        local ingredient = recipe.ingredients[i]
        if exports.ox_inventory:Search(source, 'count', ingredient.item) < ingredient.amount * quantity then
            return false
        end
    end

    for i = 1, #recipe.ingredients do
        local ingredient = recipe.ingredients[i]
        exports.ox_inventory:RemoveItem(source, ingredient.item, ingredient.amount * quantity)
    end

    pendingCooks[source] = { key = recipeKey, quantity = quantity }
    return true
end)

RegisterNetEvent('fg_druglab:server:finishCook', function(recipeKey)
    local source = source
    local pending = pendingCooks[source]
    if not pending or pending.key ~= recipeKey then return end
    pendingCooks[source] = nil

    local recipe = config.recipes[recipeKey]
    if not recipe then return end

    local amount = recipe.output.amount * pending.quantity
    exports.ox_inventory:AddItem(source, recipe.output.item, amount)
    exports.qbx_core:Notify(source, locale('success.cook_complete', amount, exports.ox_inventory:Items()[recipe.output.item].label), 'success')
end)

AddEventHandler('playerDropped', function()
    pendingCooks[source] = nil
end)
