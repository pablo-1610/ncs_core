---setLastSource
---@param source number
---@public
function NCSPlayer:setLastSource(source)
    MOD_Players:setLastSource(self.identifier, source)
end