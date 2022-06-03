---sendData
---@public
function NCSPlayer:sendData()
    self:triggerEvent("setCache", NCSEnum.CacheType.PLAYER_DATA, self:minify())
end