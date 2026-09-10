local config = lib.load('qbx_disableservices.config')

local function applyState(npcPoliceActive)
    SetMaxWantedLevel(npcPoliceActive and config.wantedLevel.withNpcPolice or config.wantedLevel.withoutNpcPolice)

    -- EnableDispatchService alone isn't enough - qbx_ignore used to hard-disable random cop
    -- creation at boot, which would silently block every police ped/vehicle regardless of
    -- dispatch/wanted settings. That's toggled here instead, in lockstep with everything else.
    SetCreateRandomCops(npcPoliceActive)
    SetCreateRandomCopsNotOnScenarios(npcPoliceActive)
    SetCreateRandomCopsOnScenarios(npcPoliceActive)

    -- qbx_density used to permanently set COP -> PLAYER to Respect (1) so stray cop peds would
    -- never turn hostile. That also stops a wanted player from ever actually being engaged, since
    -- the AI's own relationship group toward PLAYER has to read as Hate for it to fight back.
    -- Relationship levels: 0 Companion, 1 Respect, 2 Like, 3 Neutral, 4 Dislike, 5 Hate.
    local copRelationship = npcPoliceActive and 5 or 1
    SetRelationshipBetweenGroups(copRelationship, `COP`, `PLAYER`)
    SetRelationshipBetweenGroups(copRelationship, `PLAYER`, `COP`)

    for key, value in pairs(config.npcPoliceServices) do
        EnableDispatchService(key, npcPoliceActive and value)
    end

    for key, value in pairs(config.alwaysDisabledServices) do
        EnableDispatchService(key, value)
    end
end

RegisterNetEvent('qbx_disableservices:client:setNpcPolice', applyState)

CreateThread(function()
    local npcPoliceActive = lib.callback.await('qbx_disableservices:server:getNpcPoliceState', false)
    applyState(npcPoliceActive)
end)
