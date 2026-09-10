return {
	General = {
		name = 'Shop',
		blip = {
			id = 59, colour = 69, scale = 0.8
		}, inventory = {
			{ name = 'burger', price = 10 },
			{ name = 'water', price = 10 },
			{ name = 'cola', price = 10 },
		}, locations = {
			vec3(25.7, -1347.3, 29.49),
			vec3(-3038.71, 585.9, 7.9),
			vec3(-3241.47, 1001.14, 12.83),
			vec3(1728.66, 6414.16, 35.03),
			vec3(1697.99, 4924.4, 42.06),
			vec3(1961.48, 3739.96, 32.34),
			vec3(547.79, 2671.79, 42.15),
			vec3(2679.25, 3280.12, 55.24),
			vec3(2557.94, 382.05, 108.62),
			vec3(373.55, 325.56, 103.56),
		}, targets = {
			{ loc = vec3(25.06, -1347.32, 29.5), length = 0.7, width = 0.5, heading = 0.0, minZ = 29.5, maxZ = 29.9, distance = 1.5 },
			{ loc = vec3(-3039.18, 585.13, 7.91), length = 0.6, width = 0.5, heading = 15.0, minZ = 7.91, maxZ = 8.31, distance = 1.5 },
			{ loc = vec3(-3242.2, 1000.58, 12.83), length = 0.6, width = 0.6, heading = 175.0, minZ = 12.83, maxZ = 13.23, distance = 1.5 },
			{ loc = vec3(1728.39, 6414.95, 35.04), length = 0.6, width = 0.6, heading = 65.0, minZ = 35.04, maxZ = 35.44, distance = 1.5 },
			{ loc = vec3(1698.37, 4923.43, 42.06), length = 0.5, width = 0.5, heading = 235.0, minZ = 42.06, maxZ = 42.46, distance = 1.5 },
			{ loc = vec3(1960.54, 3740.28, 32.34), length = 0.6, width = 0.5, heading = 120.0, minZ = 32.34, maxZ = 32.74, distance = 1.5 },
			{ loc = vec3(548.5, 2671.25, 42.16), length = 0.6, width = 0.5, heading = 10.0, minZ = 42.16, maxZ = 42.56, distance = 1.5 },
			{ loc = vec3(2678.29, 3279.94, 55.24), length = 0.6, width = 0.5, heading = 330.0, minZ = 55.24, maxZ = 55.64, distance = 1.5 },
			{ loc = vec3(2557.19, 381.4, 108.62), length = 0.6, width = 0.5, heading = 0.0, minZ = 108.62, maxZ = 109.02, distance = 1.5 },
			{ loc = vec3(373.13, 326.29, 103.57), length = 0.6, width = 0.5, heading = 345.0, minZ = 103.57, maxZ = 103.97, distance = 1.5 },
		}
	},

	Liquor = {
		name = 'Liquor Store',
		blip = {
			id = 93, colour = 69, scale = 0.8
		}, inventory = {
			{ name = 'water', price = 10 },
			{ name = 'cola', price = 10 },
			{ name = 'burger', price = 15 },
		}, locations = {
			vec3(1135.808, -982.281, 46.415),
			vec3(-1222.915, -906.983, 12.326),
			vec3(-1487.553, -379.107, 40.163),
			vec3(-2968.243, 390.910, 15.043),
			vec3(1166.024, 2708.930, 38.157),
			vec3(1392.562, 3604.684, 34.980),
			vec3(-1393.409, -606.624, 30.319)
		}, targets = {
			{ loc = vec3(1134.9, -982.34, 46.41), length = 0.5, width = 0.5, heading = 96.0, minZ = 46.4, maxZ = 46.8, distance = 1.5 },
			{ loc = vec3(-1222.33, -907.82, 12.43), length = 0.6, width = 0.5, heading = 32.7, minZ = 12.3, maxZ = 12.7, distance = 1.5 },
			{ loc = vec3(-1486.67, -378.46, 40.26), length = 0.6, width = 0.5, heading = 133.77, minZ = 40.1, maxZ = 40.5, distance = 1.5 },
			{ loc = vec3(-2967.0, 390.9, 15.14), length = 0.7, width = 0.5, heading = 85.23, minZ = 15.0, maxZ = 15.4, distance = 1.5 },
			{ loc = vec3(1165.95, 2710.20, 38.26), length = 0.6, width = 0.5, heading = 178.84, minZ = 38.1, maxZ = 38.5, distance = 1.5 },
			{ loc = vec3(1393.0, 3605.95, 35.11), length = 0.6, width = 0.6, heading = 200.0, minZ = 35.0, maxZ = 35.4, distance = 1.5 }
		}
	},

	YouTool = {
		name = 'YouTool',
		blip = {
			id = 402, colour = 69, scale = 0.8
		}, inventory = {
			{ name = 'lockpick', price = 10 },
			{ name = 'tire', price = 100 },
			{ name = 'repairkit', price = 150 },
			{ name = 'advancedrepairkit', price = 400 },
		}, locations = {
			vec3(2748.0, 3473.0, 55.67),
			vec3(342.99, -1298.26, 32.51)
		}, targets = {
			{ loc = vec3(2746.8, 3473.13, 55.67), length = 0.6, width = 3.0, heading = 65.0, minZ = 55.0, maxZ = 56.8, distance = 3.0 }
		}
	},

	-- Thief-only: drug seeds/ingredients, hidden from the public YouTool stock above
	ThiefSupply = {
		name = 'Thief Supply',
		groups = {
			['thief'] = 0
		},
		inventory = {
			-- Seed price scales with strain tier (1 weakest - 5 top shelf)
			{ name = 'weed_white-widow_seed', price = 200 }, -- Tier 1
			{ name = 'weed_skunk_seed', price = 275 }, -- Tier 2
			{ name = 'weed_og-kush_seed', price = 350 }, -- Tier 3
			{ name = 'weed_purple-haze_seed', price = 450 }, -- Tier 4
			{ name = 'weed_amnesia_seed', price = 600 }, -- Tier 5
			{ name = 'weed_ak47_seed', price = 600 }, -- Tier 5
			{ name = 'weed_nutrition', price = 50 },
			{ name = 'weed_healthygrow', price = 300 },
			{ name = 'empty_weed_bag', price = 5 },
			-- Raw ingredients for fg_druglab - cook these into product at a lab
			{ name = 'meth_ingredient', price = 150 },
			{ name = 'coke_ingredient', price = 200 },
			{ name = 'baking_soda', price = 20 },
		}, locations = {
			vec3(2748.0, 3473.0, 55.67),
			vec3(342.99, -1298.26, 32.51)
		}, targets = {
			{ loc = vec3(2746.8, 3473.13, 55.67), length = 0.6, width = 3.0, heading = 65.0, minZ = 55.0, maxZ = 56.8, distance = 3.0 }
		}
	},

	Ammunation = {
		name = 'Ammunation',
		blip = {
			id = 110, colour = 69, scale = 0.8
		}, inventory = {
			{ name = 'ammo-9', price = 5, },
			{ name = 'WEAPON_KNIFE', price = 200 },
			{ name = 'WEAPON_BAT', price = 100 },
			{ name = 'WEAPON_PISTOL', price = 1000, metadata = { registered = true }, license = 'weapon' },

			-- Pistols
			{ name = 'WEAPON_APPISTOL', price = 1500, metadata = { registered = true }, license = 'weapon' },
			{ name = 'WEAPON_CERAMICPISTOL', price = 2500, metadata = { registered = true }, license = 'weapon' },
			{ name = 'WEAPON_PISTOLXM3', price = 2200, metadata = { registered = true }, license = 'weapon' },
			{ name = 'WEAPON_COMBATPISTOL', price = 1200, metadata = { registered = true }, license = 'weapon' },
			{ name = 'WEAPON_HEAVYPISTOL', price = 1800, metadata = { registered = true }, license = 'weapon' },
			{ name = 'WEAPON_MARKSMANPISTOL', price = 2000, metadata = { registered = true }, license = 'weapon' },
			{ name = 'WEAPON_MACHINEPISTOL', price = 2800, metadata = { registered = true }, license = 'weapon' },
			{ name = 'WEAPON_PISTOL50', price = 2500, metadata = { registered = true }, license = 'weapon' },
			{ name = 'WEAPON_PISTOL_MK2', price = 1600, metadata = { registered = true }, license = 'weapon' },
			{ name = 'WEAPON_SNSPISTOL', price = 900, metadata = { registered = true }, license = 'weapon' },
			{ name = 'WEAPON_SNSPISTOL_MK2', price = 1300, metadata = { registered = true }, license = 'weapon' },
			{ name = 'WEAPON_VINTAGEPISTOL', price = 1400, metadata = { registered = true }, license = 'weapon' },

			-- Revolvers
			{ name = 'WEAPON_DOUBLEACTION', price = 2200, metadata = { registered = true }, license = 'weapon' },
			{ name = 'WEAPON_NAVYREVOLVER', price = 2600, metadata = { registered = true }, license = 'weapon' },
			{ name = 'WEAPON_REVOLVER', price = 2000, metadata = { registered = true }, license = 'weapon' },
			{ name = 'WEAPON_REVOLVER_MK2', price = 2800, metadata = { registered = true }, license = 'weapon' },

			-- SMGs
			{ name = 'WEAPON_TECPISTOL', price = 3200, metadata = { registered = true }, license = 'weapon' },
			{ name = 'WEAPON_ASSAULTSMG', price = 4500, metadata = { registered = true }, license = 'weapon' },
			{ name = 'WEAPON_COMBATPDW', price = 4200, metadata = { registered = true }, license = 'weapon' },
			{ name = 'WEAPON_MICROSMG', price = 2500, metadata = { registered = true }, license = 'weapon' },
			{ name = 'WEAPON_MINISMG', price = 3000, metadata = { registered = true }, license = 'weapon' },
			{ name = 'WEAPON_SMG', price = 3500, metadata = { registered = true }, license = 'weapon' },
			{ name = 'WEAPON_SMG_MK2', price = 4000, metadata = { registered = true }, license = 'weapon' },
			{ name = 'WEAPON_GUSENBERG', price = 5000, metadata = { registered = true }, license = 'weapon' },

			-- Rifles
			{ name = 'WEAPON_BATTLERIFLE', price = 9500, metadata = { registered = true }, license = 'weapon' },
			{ name = 'WEAPON_ADVANCEDRIFLE', price = 7000, metadata = { registered = true }, license = 'weapon' },
			{ name = 'WEAPON_ASSAULTRIFLE', price = 6500, metadata = { registered = true }, license = 'weapon' },
			{ name = 'WEAPON_ASSAULTRIFLE_MK2', price = 8500, metadata = { registered = true }, license = 'weapon' },
			{ name = 'WEAPON_BULLPUPRIFLE', price = 6800, metadata = { registered = true }, license = 'weapon' },
			{ name = 'WEAPON_BULLPUPRIFLE_MK2', price = 8200, metadata = { registered = true }, license = 'weapon' },
			{ name = 'WEAPON_CARBINERIFLE', price = 7200, metadata = { registered = true }, license = 'weapon' },
			{ name = 'WEAPON_CARBINERIFLE_MK2', price = 8800, metadata = { registered = true }, license = 'weapon' },
			{ name = 'WEAPON_COMPACTRIFLE', price = 6000, metadata = { registered = true }, license = 'weapon' },
			{ name = 'WEAPON_HEAVYRIFLE', price = 8000, metadata = { registered = true }, license = 'weapon' },
			{ name = 'WEAPON_MARKSMANRIFLE', price = 9000, metadata = { registered = true }, license = 'weapon' },
			{ name = 'WEAPON_MARKSMANRIFLE_MK2', price = 10500, metadata = { registered = true }, license = 'weapon' },
			{ name = 'WEAPON_MILITARYRIFLE', price = 8600, metadata = { registered = true }, license = 'weapon' },
			{ name = 'WEAPON_SPECIALCARBINE', price = 7600, metadata = { registered = true }, license = 'weapon' },
			{ name = 'WEAPON_SPECIALCARBINE_MK2', price = 9200, metadata = { registered = true }, license = 'weapon' },
			{ name = 'WEAPON_PRECISIONRIFLE', price = 11000, metadata = { registered = true }, license = 'weapon' },
			{ name = 'WEAPON_TACTICALRIFLE', price = 7800, metadata = { registered = true }, license = 'weapon' },

			-- Shotguns
			{ name = 'WEAPON_ASSAULTSHOTGUN', price = 4500, metadata = { registered = true }, license = 'weapon' },
			{ name = 'WEAPON_BULLPUPSHOTGUN', price = 4200, metadata = { registered = true }, license = 'weapon' },
			{ name = 'WEAPON_COMBATSHOTGUN', price = 3800, metadata = { registered = true }, license = 'weapon' },
			{ name = 'WEAPON_DBSHOTGUN', price = 2500, metadata = { registered = true }, license = 'weapon' },
			{ name = 'WEAPON_HEAVYSHOTGUN', price = 4000, metadata = { registered = true }, license = 'weapon' },
			{ name = 'WEAPON_PUMPSHOTGUN', price = 2200, metadata = { registered = true }, license = 'weapon' },
			{ name = 'WEAPON_PUMPSHOTGUN_MK2', price = 3200, metadata = { registered = true }, license = 'weapon' },
			{ name = 'WEAPON_SAWNOFFSHOTGUN', price = 1800, metadata = { registered = true }, license = 'weapon' },
			{ name = 'WEAPON_AUTOSHOTGUN', price = 5000, metadata = { registered = true }, license = 'weapon' },

			-- Snipers
			{ name = 'WEAPON_HEAVYSNIPER', price = 14000, metadata = { registered = true }, license = 'weapon' },
			{ name = 'WEAPON_HEAVYSNIPER_MK2', price = 17000, metadata = { registered = true }, license = 'weapon' },
			{ name = 'WEAPON_SNIPERRIFLE', price = 11000, metadata = { registered = true }, license = 'weapon' },

			-- Machine Guns
			{ name = 'WEAPON_COMBATMG', price = 15000, metadata = { registered = true }, license = 'weapon' },
			{ name = 'WEAPON_COMBATMG_MK2', price = 18000, metadata = { registered = true }, license = 'weapon' },
			{ name = 'WEAPON_MG', price = 13000, metadata = { registered = true }, license = 'weapon' },

			-- Ammo for everything above
			{ name = 'ammo-22', price = 4 },
			{ name = 'ammo-38', price = 6 },
			{ name = 'ammo-44', price = 8 },
			{ name = 'ammo-45', price = 7 },
			{ name = 'ammo-50', price = 10 },
			{ name = 'ammo-rifle', price = 8 },
			{ name = 'ammo-rifle2', price = 9 },
			{ name = 'ammo-shotgun', price = 10 },
			{ name = 'ammo-sniper', price = 15 },
			{ name = 'ammo-heavysniper', price = 20 },
		}, locations = {
			vec3(-662.180, -934.961, 21.829),
			vec3(810.25, -2157.60, 29.62),
			vec3(1693.44, 3760.16, 34.71),
			vec3(-330.24, 6083.88, 31.45),
			vec3(252.63, -50.00, 69.94),
			vec3(22.56, -1109.89, 29.80),
			vec3(2567.69, 294.38, 108.73),
			vec3(-1117.58, 2698.61, 18.55),
			vec3(842.44, -1033.42, 28.19)
		}, targets = {
			{ loc = vec3(-660.92, -934.10, 21.94), length = 0.6, width = 0.5, heading = 180.0, minZ = 21.8, maxZ = 22.2, distance = 2.0 },
			{ loc = vec3(808.86, -2158.50, 29.73), length = 0.6, width = 0.5, heading = 360.0, minZ = 29.6, maxZ = 30.0, distance = 2.0 },
			{ loc = vec3(1693.57, 3761.60, 34.82), length = 0.6, width = 0.5, heading = 227.39, minZ = 34.7, maxZ = 35.1, distance = 2.0 },
			{ loc = vec3(-330.29, 6085.54, 31.57), length = 0.6, width = 0.5, heading = 225.0, minZ = 31.4, maxZ = 31.8, distance = 2.0 },
			{ loc = vec3(252.85, -51.62, 70.0), length = 0.6, width = 0.5, heading = 70.0, minZ = 69.9, maxZ = 70.3, distance = 2.0 },
			{ loc = vec3(23.68, -1106.46, 29.91), length = 0.6, width = 0.5, heading = 160.0, minZ = 29.8, maxZ = 30.2, distance = 2.0 },
			{ loc = vec3(2566.59, 293.13, 108.85), length = 0.6, width = 0.5, heading = 360.0, minZ = 108.7, maxZ = 109.1, distance = 2.0 },
			{ loc = vec3(-1117.61, 2700.26, 18.67), length = 0.6, width = 0.5, heading = 221.82, minZ = 18.5, maxZ = 18.9, distance = 2.0 },
			{ loc = vec3(841.05, -1034.76, 28.31), length = 0.6, width = 0.5, heading = 360.0, minZ = 28.2, maxZ = 28.6, distance = 2.0 }
		}
	},

	PoliceArmoury = {
		name = 'Police Armoury',
		groups = shared.police,
		blip = {
			id = 110, colour = 84, scale = 0.8
		}, inventory = {
			{ name = 'ammo-9', price = 5, },
			{ name = 'ammo-rifle', price = 5, },
			{ name = 'WEAPON_FLASHLIGHT', price = 200 },
			{ name = 'WEAPON_NIGHTSTICK', price = 100 },
			{ name = 'WEAPON_PISTOL', price = 500, metadata = { registered = true, serial = 'POL' }, license = 'weapon' },
			{ name = 'WEAPON_CARBINERIFLE', price = 1000, metadata = { registered = true, serial = 'POL' }, license = 'weapon', grade = 3 },
			{ name = 'WEAPON_STUNGUN', price = 500, metadata = { registered = true, serial = 'POL'} }
		}, locations = {
			vec3(451.51, -979.44, 30.68)
		}, targets = {
			{ loc = vec3(453.21, -980.03, 30.68), length = 0.5, width = 3.0, heading = 270.0, minZ = 30.5, maxZ = 32.0, distance = 6 }
		}
	},

	Medicine = {
		name = 'Medicine Cabinet',
		groups = {
			['ambulance'] = 0
		},
		blip = {
			id = 403, colour = 69, scale = 0.8
		}, inventory = {
			{ name = 'medikit', price = 26 },
			{ name = 'bandage', price = 5 }
		}, locations = {
			vec3(306.3687, -601.5139, 43.28406)
		}, targets = {

		}
	},

	BlackMarketArms = {
		name = 'Black Market (Arms)',
		inventory = {
			{ name = 'WEAPON_DAGGER', price = 5000, metadata = { registered = false	}, currency = 'black_money' },
			{ name = 'WEAPON_CERAMICPISTOL', price = 50000, metadata = { registered = false }, currency = 'black_money' },
			{ name = 'at_suppressor_light', price = 50000, currency = 'black_money' },
			{ name = 'ammo-rifle', price = 1000, currency = 'black_money' },
			{ name = 'ammo-rifle2', price = 1000, currency = 'black_money' }
		}, locations = {
			vec3(309.09, -913.75, 56.46)
		}, targets = {

		}
	},

	-- Heavy/specialty arms not carried by the regular Ammunation stock above - launchers, miniguns,
	-- explosives, novelty sci-fi guns, and the stun gun (previously police-only).
	HeavyArms = {
		name = 'Heavy Arms Dealer',
		blip = {
			id = 110, colour = 1, scale = 0.8
		}, inventory = {
			{ name = 'WEAPON_STUNGUN', price = 3000, metadata = { registered = true }, license = 'weapon' },
			{ name = 'WEAPON_MUSKET', price = 5000, metadata = { registered = true }, license = 'weapon' },
			{ name = 'WEAPON_FLAREGUN', price = 2000, metadata = { registered = true }, license = 'weapon' },

			-- Launchers / explosives ordnance
			{ name = 'WEAPON_COMPACTLAUNCHER', price = 45000, metadata = { registered = true }, license = 'weapon' },
			{ name = 'WEAPON_GRENADELAUNCHER', price = 60000, metadata = { registered = true }, license = 'weapon' },
			{ name = 'WEAPON_EMPLAUNCHER', price = 80000, metadata = { registered = true }, license = 'weapon' },
			{ name = 'WEAPON_FIREWORK', price = 20000, metadata = { registered = true }, license = 'weapon' },
			{ name = 'WEAPON_SNOWLAUNCHER', price = 15000, metadata = { registered = true }, license = 'weapon' },
			{ name = 'WEAPON_RPG', price = 150000, metadata = { registered = true }, license = 'weapon' },
			{ name = 'WEAPON_HOMINGLAUNCHER', price = 300000, metadata = { registered = true }, license = 'weapon' },
			{ name = 'WEAPON_RAILGUN', price = 200000, metadata = { registered = true }, license = 'weapon' },
			{ name = 'WEAPON_RAILGUNXM3', price = 220000, metadata = { registered = true }, license = 'weapon' },
			{ name = 'WEAPON_MINIGUN', price = 250000, metadata = { registered = true }, license = 'weapon' },

			-- Sci-fi / novelty gimmick weapons
			{ name = 'WEAPON_GADGETPISTOL', price = 40000, metadata = { registered = true }, license = 'weapon' },
			{ name = 'WEAPON_RAYPISTOL', price = 35000, metadata = { registered = true }, license = 'weapon' },
			{ name = 'WEAPON_RAYCARBINE', price = 45000, metadata = { registered = true }, license = 'weapon' },
			{ name = 'WEAPON_RAYMINIGUN', price = 90000, metadata = { registered = true }, license = 'weapon' },

			-- Throwables
			{ name = 'WEAPON_GRENADE', price = 500, license = 'weapon' },
			{ name = 'WEAPON_STICKYBOMB', price = 800, license = 'weapon' },
			{ name = 'WEAPON_PIPEBOMB', price = 600, license = 'weapon' },
			{ name = 'WEAPON_PROXMINE', price = 900, license = 'weapon' },
			{ name = 'WEAPON_MOLOTOV', price = 300, license = 'weapon' },
			{ name = 'WEAPON_SMOKEGRENADE', price = 250, license = 'weapon' },
			{ name = 'WEAPON_BZGAS', price = 350, license = 'weapon' },
			{ name = 'WEAPON_TEARGAS', price = 350, license = 'weapon' },

			-- Ammo for everything above that Ammunation doesn't already stock
			{ name = 'ammo-grenade', price = 15 },
			{ name = 'ammo-rocket', price = 25 },
			{ name = 'ammo-railgun', price = 30 },
			{ name = 'ammo-emp', price = 15 },
			{ name = 'ammo-firework', price = 10 },
			{ name = 'ammo-flare', price = 10 },
			{ name = 'ammo-musket', price = 8 },
			{ name = 'ammo-laser', price = 5 },
		}, locations = {
			vec3(-2351.47, 3252.6, 91.9)
		}, targets = {
			{ loc = vec3(-2351.47, 3252.6, 91.9), length = 0.6, width = 3.0, heading = 333.16, minZ = 91.7, maxZ = 93.5, distance = 3.0 }
		}
	},

	VendingMachineDrinks = {
		name = 'Vending Machine',
		inventory = {
			{ name = 'water', price = 10 },
			{ name = 'cola', price = 10 },
		},
		model = {
			`prop_vend_soda_02`, `prop_vend_fridge01`, `prop_vend_water_01`, `prop_vend_soda_01`
		}
	}
}
