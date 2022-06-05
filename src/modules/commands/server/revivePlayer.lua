API_Commands.registerPermissionCommand("revive", "canRevive", function(player, args)
    if (player.isDead) then
        API_Player:revive(player.serverId)
    end
end)