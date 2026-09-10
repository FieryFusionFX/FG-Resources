local config            = lib.load('configs.server')
local prisonBreakcfg    = lib.load('configs.prisonbreak')
local db                = require 'server.modules.db'
local utils             = require 'server.modules.utils'
local ox_inventory      = exports.ox_inventory
local globalState       = GlobalState
local confiscated       = {}

-- Only drug contraband is seized on arrest - cash, phone, weapons, and everything else stay with
-- the player. Seized drugs are destroyed outright (never stored for return). Keep this list in
-- sync with the equivalent one in qbx_ambulancejob/server/hospital.lua.
local drugItems = {
    ['weed_ak47'] = true, ['weed_ak47_seed'] = true,
    ['weed_skunk'] = true, ['weed_skunk_seed'] = true,
    ['weed_amnesia'] = true, ['weed_amnesia_seed'] = true,
    ['weed_og-kush'] = true, ['weed_og-kush_seed'] = true,
    ['weed_white-widow'] = true, ['weed_white-widow_seed'] = true,
    ['weed_purple-haze'] = true, ['weed_purple-haze_seed'] = true,
    ['weed_brick'] = true,
    ['joint'] = true,
    ['crack_baggy'] = true,
    ['cokebaggy'] = true,
    ['coke_ingredient'] = true,
    ['coke_brick'] = true,
    ['coke_small_brick'] = true,
    ['xtcbaggy'] = true,
    ['meth'] = true,
    ['meth_ingredient'] = true,
    ['oxy'] = true,
    ['baking_soda'] = true,
}

local function savePlayerJailTime(src)
    local state = Player(src).state
    local jailTime = state and state.jailTime or 0
    local cid = getCharID(src) or state and state.xtprison_identifier
    if not cid then return lib.print.debug('player core identifier not found, not saving jailtime') end
    MySQL.insert.await(db.UPDATE_JAILTIME, { cid, jailTime })

    if confiscated[cid] then
        ox_inventory:ReturnInventory(src)
        confiscated[cid] = nil
    end
end

local function loadPlayerJailTime(src)
    local cid = getCharID(src)
    local getJailTime = MySQL.scalar.await(db.LOAD_JAILTIME, { cid })
    local setTime = setJailTime(src, getJailTime or 0)
    return setTime and getJailTime or 0
end

-- Get Jail Time --
lib.callback.register('xt-prison:server:initJailTime', function(source)
    return loadPlayerJailTime(source)
end)

-- Save Jail Time --
RegisterNetEvent('xt-prison:server:saveJailTime', function()
    local src = source
    savePlayerJailTime(src)
end)

-- Remove Player Job --
lib.callback.register('xt-prison:server:removeJob', function(source)
    if not charHasJob(source, config.UnemployedJobName) then
        if setCharJob(source, config.UnemployedJobName) then
            lib.notify(source, {
                title = locale('notify.lost_job'),
                icon = 'fas fa-ban',
                type = 'error'
            })
            return true
        end
    else
        return true
    end

    return false
end)

-- Remove Items on Entry --
RegisterNetEvent('xt-prison:server:removeItems', function()
    local src = source
    local cid = getCharID(src)
    if not cid then return end
    if confiscated[cid] then return end

    local playerItems = ox_inventory:GetInventoryItems(src)
    if not playerItems or not next(playerItems) then
        confiscated[cid] = true
        return
    end

    local tookAny = false
    for _, item in pairs(playerItems) do
        if drugItems[item.name] then
            ox_inventory:RemoveItem(src, item.name, item.count, item.metadata, item.slot)
            tookAny = true
        end
    end

    confiscated[cid] = true

    if tookAny then
        lib.notify(src, {
            title = locale('notify.confiscated'),
            icon = 'fas fa-trash',
            type = 'error'
        })
    end
end)

-- Drugs seized on arrest are destroyed for good, not held for return. Cash, phone, weapons, and
-- everything else were never taken in the first place, so there's nothing left to restore here -
-- this just clears the jail-entry bookkeeping.
RegisterNetEvent('xt-prison:server:returnItems', function()
    local src = source
    local cid = getCharID(src)
    if not cid then return end

    if Player(src).state.jailTime > 0 then
        utils.banPlayer(src, cid)
        return
    end

    if not confiscated[cid] then return end
    confiscated[cid] = nil
end)

-- Set Jail Time --
lib.callback.register('xt-prison:server:setJailStatus', function(source, setTime)
    local src = source
    local playerState = Player(src)?.state
    if not playerState then return end

    local jailTime = playerState.jailTime
    if jailTime == setTime then
        return true
    end

    setJailTime(src, ((setTime < 0) and 0 or setTime))

    return true
end)

-- Check if Player is a Lifer --
lib.callback.register('xt-prison:server:liferCheck', function(source)
    return utils.liferCheck(source)
end)

-- Receive Canteen Meal --
lib.callback.register('xt-prison:server:receiveCanteenMeal', function(source)
    local food = config.CanteenMeal.food
    local drink = config.CanteenMeal.drink
    if ox_inventory:AddItem(source, food.item, food.count) and ox_inventory:AddItem(source, drink.item, drink.count) then
        return true
    end
    return false
end)

-- Checks Time Left --
local lastTimeCheck = {}

local function initTimeCheck(source)
    lastTimeCheck[source] = lib.timer(5000, function()
        lastTimeCheck[source] = nil
    end, true)
end

lib.callback.register('xt-prison:server:checkJailTime', function(source)
    if lastTimeCheck[source] then
        lib.notify(source, {
            title = locale('notify.wait_before_check'),
            icon = 'fas fa-hourglass-half',
            type = 'error'
        })
        return
    end

    initTimeCheck(source) -- init timer

    return utils.checkJailTime(source)
end)

-- Constantly Update Cop Count --
AddEventHandler('onResourceStart', function(resource)
    if resource ~= GetCurrentResourceName() then return end
    if prisonBreakcfg.MinimumPolice == 0 then
        globalState.copCount = 0
        return
    end

    SetInterval(function()
        local players = GetPlayers()
        local count = 0

        for _, src in pairs(players) do
            src = src and tonumber(src) or false
            local player = src and getPlayer(src) or false
            if player then
                if charHasJob(src, config.policeJobs) then
                    count += 1
                end
            end
        end

        if globalState.copCount ~= count then
            globalState.copCount = count
        end
    end, 120000)
end)

AddEventHandler('playerDropped', function(reason)
    local src = source
    savePlayerJailTime(src)
end)
