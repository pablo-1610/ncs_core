---setInInstance
---@param self NCSPlayer
---@param instanceId number
---@public
function NCSPlayer.setInInstance(self, instanceId)
    SetPlayerRoutingBucket(self.serverId, instanceId)
end