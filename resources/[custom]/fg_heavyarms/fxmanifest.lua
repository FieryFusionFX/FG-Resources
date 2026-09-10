fx_version 'cerulean'
game 'gta5'

author 'Fierygames'
description 'A static army-ped shopkeeper standing at the Heavy Arms Dealer location'
version '1.0.0'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua',
}

client_script 'client/main.lua'

lua54 'yes'
use_experimental_fxv2_oal 'yes'

dependencies {
    'ox_lib',
}
