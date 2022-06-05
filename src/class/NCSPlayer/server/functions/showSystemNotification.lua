---notify
---@param self NCSPlayer
---@param text string
---@param logType number
---@public
function NCSPlayer.showSystemNotification(self, text, logType)
    local prefix = ""
    if (logType) then
        local data = NCSEnum._getLogTypeDisplayData(logType)
        prefix = ("[%s%s~s~] "):format(data.clientColor, data.displayName)
    end
    self:showNotification(("%s%s"):format(prefix, text))
end