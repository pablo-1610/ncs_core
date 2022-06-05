---notify
---@param text string
---@param colorBg number
---@param self NCSPlayer
---@public
function NCSPlayer.showNotification(self, text, colorBg)
    self:triggerEvent("showNotification", text, colorBg)
end