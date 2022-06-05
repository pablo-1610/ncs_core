---addInfraction
---@param player NCSPlayer
---@param infractionType string
---@public
function MOD_AntiCheat:addInfraction(player, infractionType)
    print(("(^1NCS^7) ^3/!\\ ^7[^1ANTICHEAT^7] ^3%s^7 (^3%i^7) : ^1%s^7"):format(player.name, player.serverId, infractionType))
    if (self.infractionsListeners[infractionType]) then
        for _, listener in pairs(self.infractionsListeners[infractionType]) do
            listener(player)
        end
    end
end