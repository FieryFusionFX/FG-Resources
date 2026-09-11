return {
    payoutCurrency = 'black_money', -- dirty money, same as corner-selling and player deals - launder it via fg_laundering
    policeCallChance = 15, -- % chance a sale tips off police, matches qbx_drugs corner-selling
    interactionDistance = 2.0,
    undercoverRotateInterval = 60 * 60 * 1000, -- 1 hour - one random dealer becomes an undercover cop that guarantees a police call

    sellableItems = {
        'weed_white-widow', 'weed_skunk', 'weed_purple-haze', 'weed_og-kush', 'weed_amnesia', 'weed_ak47',
        'meth', 'cokebaggy', 'crack_baggy',
    },

    -- per-unit price range the dealer pays, matches qbx_drugs' corner-selling rates
    -- Weed strains are ranked Tier 1 (weakest) to Tier 5 (top shelf) - higher tier sells for more.
    -- Sell price always clears the seed/ingredient cost so growing/cooking stays profitable.
    prices = {
        ['weed_white-widow'] = { min = 220, max = 280 }, -- Tier 1, seed $200
        ['weed_skunk'] = { min = 300, max = 380 }, -- Tier 2, seed $275
        ['weed_og-kush'] = { min = 380, max = 480 }, -- Tier 3, seed $350
        ['weed_purple-haze'] = { min = 480, max = 600 }, -- Tier 4, seed $450
        ['weed_amnesia'] = { min = 620, max = 780 }, -- Tier 5, seed $600
        ['weed_ak47'] = { min = 650, max = 800 }, -- Tier 5, seed $600
        ['meth'] = { min = 80, max = 100 }, -- fg_druglab: ingredient $150 -> 5 bags/cook
        ['cokebaggy'] = { min = 190, max = 210 }, -- fg_druglab: ingredient $200 -> 5 bags/cook
        ['crack_baggy'] = { min = 210, max = 240 }, -- fg_druglab: cooked from cokebaggy + baking soda
    },

    ped = {
        model = `g_m_y_strpunk_01`,
        scenario = 'WORLD_HUMAN_HANG_OUT_STREET',
    },

    blip = {
        sprite = 496, -- Weed (radar_production_weed)
        colour = 2, -- Green
        scale = 0.8,
    },

    -- One ped per entry. Every hour the server secretly rerolls which index is the undercover cop.
    -- Each entry can set its own `model` to override the default ped skin.
    locations = {
        { coords = vec4(92.28, -1291.82, 28.27, 249.73) },
        { coords = vec4(-320.22, -773.09, 47.42, 82.22) },
        { coords = vec4(-996.95, -2615.72, 33.12, 99.03) },
        { coords = vec4(813.47, -2984.58, 5.02, 316.68) },
        { coords = vec4(895.15, -1036.32, 34.11, 323.74) },
        { coords = vec4(1257.58, 330.01, 80.99, 303.22) },
        { coords = vec4(-1289.67, -210.09, 41.45, 246.02) },
        { coords = vec4(-2521.38, 2313.26, 32.22, 294.03) },
        { coords = vec4(-1590.78, 3099.48, 31.57, 245.28), model = `s_m_y_marine_01` }, -- army guy, per request
        { coords = vec4(1541.61, 3597.37, 34.45, 180.84) },
        { coords = vec4(1443.48, 6334.89, 22.76, 172.69) },
    },
}
