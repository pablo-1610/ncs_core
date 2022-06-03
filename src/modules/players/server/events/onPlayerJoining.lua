AddEventHandler("playerJoining", function()
    local _src<const> = source
    local identifier <const> = API_Player:getIdentifier(_src)

    if (not (MOD_Players.selectedCharacter[identifier])) then
        NCS:trace(("Error while loading player %s: no character selected"):format(identifier))
        DropPlayer(_src, _Literals.CONNECTION_ABORTED)
        return
    end

    local selectedCharacterIdentifier <const> = MOD_Players.selectedCharacter[identifier]
    MOD_Players.selectedCharacter[identifier] = nil

    ---@type NCSPlayer
    local player = NCSPlayer(_src)
    MOD_Players:set(_src, player)
    player:setCharacterByIdentifier(selectedCharacterIdentifier, function(success)
        if (not (success)) then
            NCS:trace(("Error while loading player %s: character %s not found"):format(identifier, selectedCharacterIdentifier))
            DropPlayer(_src, _Literals.CONNECTION_ABORTED)
            return
        end
        NCS:triggerEvent("playerJoining", _src, identifier, selectedCharacterIdentifier)
    end)
end)