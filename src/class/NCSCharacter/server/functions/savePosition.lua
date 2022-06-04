---savePosition
---@public
---@param self NCSCharacter
function NCSCharacter.savePosition(self)
    if (not (self.skin)) then
        return
    end

    local ped <const> = GetPlayerPed(self.user.serverId)
    local coords <const>, heading <const> = GetEntityCoords(ped), GetEntityHeading(ped)

    local positionFormat = { position = coords, heading = heading }

    API_Database:query("UPDATE ncs_players_characters SET last_position = @last_position WHERE character_id = @character_id", {
        ["@character_id"] = self.id,
        ["@last_position"] = json.encode(positionFormat)
    })
end