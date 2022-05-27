fx_version 'cerulean';
games { 'gta5' }
lua54 'yes';
use_fxv2_oal 'yes';

description 'NextCitizen, an powerfull FiveM framework RolePlay-Based';
version '1.0.0-alpha';

shared_scripts {
    "src/core/shared.lua",
    "src/enum/*.lua",
    "src/class/**/shared.lua",
};

server_scripts {
    "vendors/oxmysql/oxmysql.js",
    "src/core/server.lua",
    "src/class/**/server.lua",
};

client_scripts {
    "src/core/shard.lua",
    "src/class/**/client.lua",
};

-- Export

shared_scripts {
    "src/core/export.lua",
};