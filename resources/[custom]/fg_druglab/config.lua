return {
    interactionDistance = 1.5,

    -- Buy ingredients at YouTool, cook them here into sellable product.
    recipes = {
        meth = {
            label = 'Cook Meth',
            ingredients = { { item = 'meth_ingredient', amount = 1 } },
            output = { item = 'meth', amount = 5 },
            cookTime = 45000,
        },
        coke = {
            label = 'Cook Cocaine',
            ingredients = { { item = 'coke_ingredient', amount = 1 } },
            output = { item = 'cokebaggy', amount = 5 },
            cookTime = 45000,
        },
        crack = {
            label = 'Cook Crack',
            ingredients = { { item = 'cokebaggy', amount = 2 }, { item = 'baking_soda', amount = 1 } },
            output = { item = 'crack_baggy', amount = 5 },
            cookTime = 30000,
        },
    },

    blip = {
        colour = 1, -- Red
        scale = 0.8,
    },

    -- Each lab exposes a subset of recipes by key.
    labs = {
        { coords = vec4(1389.88, 3604.69, 38.28, 108.03), recipes = { 'meth' }, blipSprite = 497, blipName = 'Meth Lab' },
        { coords = vec4(2435.34, 4964.44, 42.18, 0.0), recipes = { 'coke', 'crack' }, blipSprite = 514, blipName = 'Drug Lab' },
    },
}
