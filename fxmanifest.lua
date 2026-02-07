fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name 'foundation-mdt'
description 'Advanced MDT System for QBCore'
author 'CornerstoneScripts'
version '1.0.0'

dependencies {
    'qb-core',
    'oxmysql',
}

shared_scripts {
    'shared/*.lua',
    'config/config.lua',
}

client_scripts {
    'client/*.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'config/departments.lua',
    'config/penalcodes.lua',
    'config/permissions.lua',
    'config/images.lua',
    'bridge/loader.lua',
    'server/*.lua',
    'server/modules/*.lua',
}

ui_page 'web/dist/index.html'

files {
    'web/dist/**',
}

escrow_ignore {
    'config/*.lua',
    'bridge/**/*.lua',
    'web/dist/**',
    'sql/*.sql',
}
