AddEventHandler("playerDropped", function(reason)
    local _src <const> = source
    local identifier <const> = API_Player:getIdentifier(_src)

    if (MOD_Players.selectedCharacter[identifier]) then
        NCS:trace(("Player id ^1%s ^7has ^1dropped ^7during the ^3connection process^7."):format(_src))
        MOD_Players.selectedCharacter[identifier] = nil
        return
    end

    if (MOD_Players:exists(_src)) then
        ---@type NCSPlayer
        local player = MOD_Players:get(identifier)
        player:disconnect()
        MOD_Players:remove(player)
    end

    NCS:trace(("Player id ^1%s ^7has ^1dropped ^7(%s)"):format(_src, reason))

    -- TODO → Remove from Players, save Player.characters, etc.
end)