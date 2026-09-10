-- Small server, often zero on-duty player police. Native NPC police fill in whenever no LEO
-- (police/sheriff/state trooper, etc. - anything with job.type == 'leo') is on duty, and step
-- aside the moment a real one clocks in, so the two systems don't end up fighting over the same
-- wanted player.
local npcPoliceActive = true

local function computeNpcPoliceActive()
    local onDutyCount = exports.qbx_core:GetDutyCountType('leo')
    return onDutyCount == 0
end

local function refreshNpcPoliceState()
    local newState = computeNpcPoliceActive()
    if newState == npcPoliceActive then return end
    npcPoliceActive = newState
    TriggerClientEvent('qbx_disableservices:client:setNpcPolice', -1, npcPoliceActive)
end

lib.callback.register('qbx_disableservices:server:getNpcPoliceState', function()
    return npcPoliceActive
end)

RegisterNetEvent('QBCore:Server:SetDuty', refreshNpcPoliceState)
RegisterNetEvent('QBCore:Server:OnJobUpdate', refreshNpcPoliceState)

AddEventHandler('playerDropped', function()
    -- give qbx_core a moment to drop this player out of QBX.Players before recounting
    SetTimeout(500, refreshNpcPoliceState)
end)

CreateThread(function()
    npcPoliceActive = computeNpcPoliceActive()
end)
