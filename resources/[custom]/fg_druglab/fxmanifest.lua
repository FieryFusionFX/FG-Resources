fx_version 'cerulean'
game 'gta5'

author 'Fierygames'
description 'Cooks raw ingredients into meth, cocaine, and crack at fixed lab locations'
version '1.0.0'

ox_lib 'locale'

shared_scripts {
    '@ox_lib/init.lua',
    '@qbx_core/modules/lib.lua',
    'config.lua',
}

client_scripts {
    '@qbx_core/modules/playerdata.lua',
    'client/main.lua',
}
server_script 'server/main.lua'

files {
    'locales/*.json'
}

lua54 'yes'
use_experimental_fxv2_oal 'yes'

dependencies {
    'ox_lib',
    'ox_inventory',
    'qbx_core',
}
