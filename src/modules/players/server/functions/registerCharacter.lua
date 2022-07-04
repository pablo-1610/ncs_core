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
    if (not validateData(identity)) then 
        if (callback) then 
            callback(nil)
        end
        return
    end

    API_Database:insert("INSERT INTO ncs_players_characters (player_identifier, identity, skin, job, job_grade, metadata) VALUES (@player_identifier, @identity, @skin, @job, @job_grade, \"[]\")", {
        ["player_identifier"] = identifier,
        ["identity"] = json.encode(identity),
        ["skin"] = json.encode(NCSConstant.DefaultSkin),
        ["job"] = NCSConstant.baseJob,
        ["job_grade"] = NCSConstant.baseJobGrade,
    }, function(characterId)
        if (callback) then
            NCS:trace(("Character created by ^3%s ^7: ^3%s %s"):format(identifier, identity.firstname, identity.lastname))
            callback(characterId)
        end
    end)
end