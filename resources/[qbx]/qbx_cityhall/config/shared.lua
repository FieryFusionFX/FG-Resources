return {
    cityhalls = {
        {
            coords = vec3(-265.0, -963.6, 31.2),
            showBlip = true,
            blip = {
                label = 'City Services',
                shortRange = true,
                sprite = 487,
                display = 4,
                scale = 0.65,
                colour = 0,
            },
            licenses = {
                ['id'] = {
                    item = 'id_card',
                    label = 'ID',
                    cost = 50,
                },
                ['driver'] = {
                    item = 'driver_license',
                    label = 'Driver License',
                    cost = 50,
                },
                ['weapon'] = {
                    item = 'weaponlicense',
                    label = 'Weapon License',
                    cost = 5000, -- matches the price of the standalone ox_inventory license vendor near Ammunation, so this isn't a cheaper shortcut around it
                },
            },
        },
    },

    employment = {
        enabled = true, -- Set to false to disable the employment menu
        jobs = {
            unemployed = 'Unemployed',
            trucker = 'Trucker',
            taxi = 'Taxi',
            tow = 'Tow Truck',
            reporter = 'News Reporter',
            garbage = 'Garbage Collector',
            bus = 'Bus Driver',
            thief = 'Thief',
        },
    },
}
