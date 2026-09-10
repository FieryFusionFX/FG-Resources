return {
    -- Native wanted level is all-or-nothing (not per-player-tunable beyond on/off), so it just
    -- swaps between these two values depending on whether NPC police are currently active.
    wantedLevel = {
        withNpcPolice = 5,
        withoutNpcPolice = 0,
    },

    -- These toggle on together when there are no on-duty LEO players, and off when there are -
    -- letting real player police take over instead of fighting native AI for the same calls.
    npcPoliceServices = {
        [1] = true,     -- PoliceAutomobile
        [2] = true,     -- PoliceHelicopter
        [4] = true,     -- SwatAutomobile
        [6] = true,     -- PoliceRiders
        [7] = true,     -- PoliceVehicleRequest
        [8] = true,     -- PoliceRoadBlock
        [9] = true,     -- PoliceAutomobileWaitPulledOver
        [10] = true,    -- PoliceAutomobileWaitCruising
        [12] = true,    -- SwatHelicopter
        [13] = true,    -- PoliceBoat
    },

    -- These stay off no matter what - not police, and better left to the player-run job systems.
    alwaysDisabledServices = {
        [3] = false,    -- FireDepartment
        [5] = false,    -- AmbulanceDepartment
        [11] = false,   -- Gangs
        [14] = false,   -- ArmyVehicle
        [15] = false,   -- BikerBackup
    },
}
