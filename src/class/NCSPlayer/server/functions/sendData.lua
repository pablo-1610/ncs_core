---sendData
---@public
---@param self NCSPlayer
function NCSPlayer.sendData(self)
    self:triggerEvent("setCache", NCSEnum.CacheType.PLAYER_DATA, self:minify())
end