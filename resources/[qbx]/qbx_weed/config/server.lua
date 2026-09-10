---@type WeedServerConfig
return {
    randomGrowAmount = { -- Random amount of progress to give on interval when growing a plant with its health above 50
        min = 100, -- fills a full stage in a single tick (was 1-3, ~576s/stage default)
        max = 100
    },
    randomHarvestAmount = { -- The random amount of weed to give for a harvest
        min = 12,
        max = 16
    },
    healthyGrowYieldMultiplier = 1.5, -- Harvest yield multiplier when the plant was fed a "Healthy Grow" booster
    plantFoodCheckInterval = 1152, -- How much seconds it takes for the plant food to be checked. Default 1152 seconds (19.2 minutes)
    plantGrowInterval = 600, -- How much seconds it takes for the plant to grow. 600s/stage x 6 stages = full grow in 1 hour
    outsidePlantsRefreshInterval = 25, -- The amount of seconds it takes to refresh outside plants. Default 25 seconds
}
