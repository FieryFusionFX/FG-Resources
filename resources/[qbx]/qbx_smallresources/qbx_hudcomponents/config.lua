return {
    disable = {
        -- https://docs.fivem.net/natives/?_0x6806C51AD12B83B8
        -- 1 (WANTED_STARS) and 2 (WEAPON_ICON/ammo count) removed from this list - qbx_hud has no
        -- custom replacement for either, so hiding them just left nothing there at all.
        hudComponents = {3, 4, 7, 9, 13, 19, 20, 21, 22},

        -- https://docs.fivem.net/docs/game-references/controls/
        controls = {37},

        -- the small white dot in the middle of the screen when aiming with a weapon.
        recticle = true,
    }
}
