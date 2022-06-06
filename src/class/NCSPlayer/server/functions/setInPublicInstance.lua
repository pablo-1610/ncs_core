---setInPublicInstance
---@param self NCSPlayer
---@public
function NCSPlayer.setInPublicInstance(self)
    SetPlayerRoutingBucket(self.serverId, 0)
end