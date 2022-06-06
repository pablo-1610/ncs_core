API_Commands.registerPermissionCommand("revive", "canRevive", function(player, args)
    if (not player.isDead) then
        return NCS:trace("Player is not dead")
    end
    API_Player:revive(player.serverId)
end) 