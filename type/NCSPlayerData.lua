---@class NCSPlayerData
local PlayerData = {
    id = nil,
    serverId = nil,
    identifier = nil,
    name = nil,
    is_dead = nil,
    death_data = {},
    role = {
        identifier = nil,
        label = nil,
        powerIndex = nil,
        permissions = {}
    },
    character = {
        id = nil,
        identity = {},
        skin = {},
        accounts = {},
        lastPosition = {},
        metadata = {}
    },
}