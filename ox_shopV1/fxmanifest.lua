fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author "viiper"
version "1.0"
description "shop full ox"



shared_script({
    '@es_extended/imports.lua',
    '@es_extended/locale.lua',
    '@ox_lib/init.lua',
    'shared/*.lua'
});

client_scripts {
    'client/**/**/*.lua'
}

server_scripts {
    "@oxmysql/lib/MySQL.lua",
    'server/**/**/*.lua'
}

