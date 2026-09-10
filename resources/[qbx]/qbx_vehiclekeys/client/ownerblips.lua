-- Puts a blip on every vehicle you own that's currently spawned in the world, visible only to you.
-- Ownership comes from the 'owner' state bag (set in server/keys.lua whenever qbx_vehicles assigns
-- a 'vehicleid' to an entity), so this covers garages, the vehicle shop, and phone call-ins alike.
local blips = {}

local function myCitizenId()
    return table.type(QBX.PlayerData) ~= 'empty' and QBX.PlayerData.citizenid or nil
end

local function removeBlip(veh)
    if blips[veh] and DoesBlipExist(blips[veh]) then
        RemoveBlip(blips[veh])
    end
    blips[veh] = nil
end

CreateThread(function()
    while true do
        Wait(3000)
        local citizenid = myCitizenId()
        if citizenid then
            local seen = {}
            local vehicles = GetGamePool('CVehicle')
            for i = 1, #vehicles do
                local veh = vehicles[i]
                if DoesEntityExist(veh) and Entity(veh).state.owner == citizenid then
                    seen[veh] = true
                    if not blips[veh] or not DoesBlipExist(blips[veh]) then
                        local blip = AddBlipForEntity(veh)
                        SetBlipSprite(blip, 225)
                        SetBlipColour(blip, 3)
                        SetBlipScale(blip, 0.8)
                        SetBlipAsShortRange(blip, true)
                        BeginTextCommandSetBlipName('STRING')
                        AddTextComponentSubstringPlayerName(locale('blip.my_vehicle'))
                        EndTextCommandSetBlipName(blip)
                        blips[veh] = blip
                    end
                end
            end

            for veh in pairs(blips) do
                if not seen[veh] then
                    removeBlip(veh)
                end
            end
        elseif next(blips) then
            for veh in pairs(blips) do
                removeBlip(veh)
            end
        end
    end
end)
