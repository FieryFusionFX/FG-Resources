return {
    doctorCallCooldown = 1, -- Time in minutes for cooldown between doctors calls
    wipeInvOnRespawn = true, -- Enable to confiscate drug contraband from the player on respawn (see drugItems in server/hospital.lua) - everything else (cash, phone, weapons, etc.) is kept
    depositSociety = function(society, amount)
        exports['Renewed-Banking']:addAccountMoney(society, amount)
    end
}