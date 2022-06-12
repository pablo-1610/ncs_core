---@class NCSPlayerData
local PlayerData = {
    id = nil,
    serverId = nil,
    identifier = nil,
    name = nil,
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
        metadata = {},
        is_dead = nil,
        death_data = {},
    },
}