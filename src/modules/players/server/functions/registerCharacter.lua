local function validateData(identity)
    return (identity.firstname ~= nil
            and identity.firstname ~= ""
            and identity.lastname ~= nil
            and identity.lastname ~= ""
            and identity.dob ~= nil
            and identity.dob ~= ""
            and identity.sex ~= nil
            and identity.sex ~= ""
            and identity.height ~= nil
            and tonumber(identity.height) ~= nil
    )
end

---registerCharacter
---@param identifier string
---@param callback function
---@public
function MOD_Players:registerCharacter(identifier, identity, callback)
    if (validateData(identity)) then
        API_Database:insert("INSERT INTO ncs_players_characters (player_identifier, identity, accounts, metadata) VALUES (@player_identifier, @identity, @accounts, \"[]\")", {
            ["player_identifier"] = identifier,
            ["identity"] = json.encode(identity),
            ["accounts"] = json.encode(MOD_Config:getDefaultAccounts())
        }, function(characterId)
            if (callback) then
                _NCS:trace(("Character created by ^3%s ^7: ^3%s %s"):format(identifier, firstname, lastname))
                callback(characterId)
            end
        end)
    else
        callback(nil)
    end
end