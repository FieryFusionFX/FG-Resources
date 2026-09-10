local config = require 'config'

local ped

CreateThread(function()
    lib.requestModel(config.model, 5000)

    ped = CreatePed(0, config.model, config.coords.x, config.coords.y, config.coords.z, config.coords.w, false, false)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, config.scenario, 0, true)
    SetModelAsNoLongerNeeded(config.model)
end)

AddEventHandler('onResourceStop', function(resourceName)
    if resourceName ~= cache.resource then return end
    if ped and DoesEntityExist(ped) then
        DeleteEntity(ped)
    end
end)
