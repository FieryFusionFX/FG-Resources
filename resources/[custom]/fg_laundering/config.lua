return {
    cutPercent = 0, -- no cut - players get the full amount back clean
    dirtyMoneyItem = 'black_money',
    launderTimeMs = 45000, -- how long the cash takes to come back clean
    locations = {
        -- Side garage door of the auto shop building - separate from the car wash bay so it stays usable
        vec3(10.57, -1405.54, 28.29),
        vec3(2545.21, 2592.05, 36.96),
    },
    interactionDistance = 1.5,
}
