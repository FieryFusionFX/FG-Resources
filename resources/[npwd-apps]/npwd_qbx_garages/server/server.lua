lib.versionCheck('Qbox-project/npwd_qbx_garages')
assert(GetResourceState('qbx_garages') == 'started', 'qbx_garages is not started')

local garageConfig = exports.qbx_garages:GetGarages()
local VEHICLES = exports.qbx_core:GetVehiclesByName()

lib.callback.register('npwd_qbx_garages:server:getPlayerVehicles', function(source)
	local player = exports.qbx_core:GetPlayer(source)
	if not player then return {} end

	local result = MySQL.query.await('SELECT * FROM player_vehicles WHERE citizenid = ?', { player.PlayerData.citizenid })
	for i = 1, #result do
		local vehicleData = result[i]
		local model = vehicleData.vehicle

		vehicleData.model = model
		vehicleData.vehicle = 'Unknown'
		vehicleData.brand = 'Vehicle'

		if vehicleData.state == 0 then
			vehicleData.state = 'out'
		elseif vehicleData.state == 1 then
			vehicleData.state = 'garaged'
		elseif vehicleData.state == 2 then
			vehicleData.state = 'impounded'
		else
			vehicleData.state = 'unknown'
		end

		if VEHICLES[model] then
			vehicleData.vehicle = VEHICLES[model].name
			vehicleData.brand = VEHICLES[model].brand
		end

		vehicleData.garage = garageConfig[vehicleData.garage]?.label or locale('states.garage_unknown')
	end

	return result
end)

-- player_vehicles.state: 0 = OUT, 1 = GARAGED, 2 = IMPOUNDED
local STATE_GARAGED = 1
local STATE_IMPOUNDED = 2

lib.callback.register('npwd_qbx_garages:server:callVehicle', function(source, plate)
	local player = exports.qbx_core:GetPlayer(source)
	if not player then return { success = false, message = locale('notification.cannot_locate') } end

	local vehicleId = exports.qbx_vehicles:GetVehicleIdByPlate(plate)
	if not vehicleId then return { success = false, message = locale('notification.cannot_locate') } end

	local vehicleData = exports.qbx_vehicles:GetPlayerVehicle(vehicleId, { citizenid = player.PlayerData.citizenid })
	if not vehicleData then return { success = false, message = locale('notification.cannot_locate') } end

	if vehicleData.state == STATE_IMPOUNDED then
		return { success = false, message = locale('notification.impounded') }
	end

	if vehicleData.state ~= STATE_GARAGED then
		return { success = false, message = locale('notification.cannot_locate') }
	end

	local ped = GetPlayerPed(source)
	local pedCoords = GetEntityCoords(ped)
	local spawnCoords = vec4(pedCoords.x, pedCoords.y, pedCoords.z, GetEntityHeading(ped))

	if lib.getClosestVehicle(spawnCoords.xyz, 3.0, false) then
		return { success = false, message = locale('notification.no_space') }
	end

	vehicleData.props.lockState = 1

	local netId, veh = qbx.spawnVehicle({ spawnSource = spawnCoords, model = vehicleData.props.model, props = vehicleData.props })
	Entity(veh).state:set('vehicleid', vehicleId, false)
	exports.qbx_vehicles:SaveVehicle(veh, { state = 0 }) -- OUT
	TriggerClientEvent('vehiclekeys:client:SetOwner', source, vehicleData.props.plate)
	TriggerEvent('qbx_garages:server:vehicleSpawned', veh)

	return { success = true, message = locale('notification.called_in') }
end)

AddEventHandler('onResourceStart', function(resourceName)
    if resourceName == 'qbx_garages' then
        garageConfig = exports.qbx_garages:GetGarages()
    end
end)

AddEventHandler('qbx_garages:server:garageRegistered', function(garageName, newGarageConfig)
    garageConfig[garageName] = newGarageConfig
end)