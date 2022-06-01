AddEventHandler("playerDropped", function(reason)
    local _src <const> = source
    local identifier <const> = API_Player:getIdentifier(_src)

    if (MOD_Players.connectingList[identifier]) then
        _NCS:trace(("Player id ^1%s ^7has ^1dropped ^7during the ^3connection process^7."):format(_src))
        MOD_Players.connectingList[identifier] = false
        return
    end

    _NCS:trace(("Player id ^1%s ^7has ^1dropped ^7(%s)"):format(_src, reason))

    -- TODO → Remove from Players, save Player.characters, etc.
end)