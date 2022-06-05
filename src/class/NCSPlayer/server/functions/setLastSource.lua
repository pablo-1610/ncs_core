---setLastSource
---@param source number
---@public
---@param self NCSPlayer
function NCSPlayer.setLastSource(self, source)
    MOD_Players:setLastSource(self.identifier, source)
end