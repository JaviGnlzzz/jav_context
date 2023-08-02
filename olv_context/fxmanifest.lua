fx_version 'cerulean'

games { 'gta5' }

author 'Javi'

lua54 'yes'

description 'Context by Javi'

ui_page 'ui/index.html'

files {
    'ui/**/**/*.*'
}

client_scripts {
    'client/*.lua',
}

exports {
    'createContextMenu'
}

dependencies {
    'es_extended'
}