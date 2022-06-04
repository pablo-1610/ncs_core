---notify
---@param text string
---@param colorBg number
---@public
---@param self NCSPlayer
function NCSPlayer.showNotification(self, text, colorBg)
    self:triggerEvent("showNotification", text, colorBg)
end