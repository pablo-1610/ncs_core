---savePosition
---@public
---@param self NCSCharacter
function NCSCharacter.saveAccounts(self)
    if (not (self.accounts)) then
        return
    end

    API_Database:query("UPDATE ncs_players_characters SET accounts = @accounts WHERE character_id = @character_id", {
        ["@character_id"] = self.id,
        ["@accounts"] = json.encode(self.accounts)
    })
end