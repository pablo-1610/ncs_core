fx_version 'cerulean';
games { 'gta5' }
lua54 'yes';
use_fxv2_oal 'yes';

description 'NextCitizen, an powerfull FiveM framework RolePlay-Based';
version '1.0.0-alpha';

-- NCS Main

shared_scripts {
    -- NCS Core
    "src/core/shared.lua",
    -- NCS Enum
    "src/enum/*.lua",
    -- NCS Class
    "src/class/**/shared.lua",
    -- NCS Api
    "src/api/**/shared.lua",
};

server_scripts {
    -- Vendors
    "vendors/oxmysql/oxmysql.js",
    -- NCS Core
    "src/core/server.lua",
    -- NCS Class
    "src/class/**/server.lua",
    -- NCS Modules
    "src/modules/**/server/*.lua",
    -- NCS API
    "src/api/**/server/*.lua",
};

client_scripts {
    -- NCS Core
    "src/core/shared.lua",
    -- NCS Client
    "src/core/client.lua",
    -- NCS Class
    "src/class/**/client.lua",
    -- NCS Modules
    "src/modules/**/client/*.lua",
    -- NCS API
    "src/api/**/client/*.lua",
};

--[[
    Post NCS Load
--]]

shared_scripts {
    -- NCS Export
    "src/core/export.lua",
};

--[[
    Testing files
--]]

server_script "test/server.lua";
client_script "test/client.lua";
shared_script "test/shared.lua";
