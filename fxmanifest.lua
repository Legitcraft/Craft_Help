fx_version 'cerulean'
game 'gta5'

description 'ESX-QB Help Text Resource'
author 'Your Name'
version '1.0'

-- Specify the resource entry point
client_script 'client.lua'


-- Define the configuration file
files {
    'config.lua',
}

-- Ensure the 'config.lua' is loaded before the client script
client_script 'config.lua'
