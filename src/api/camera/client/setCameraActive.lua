---setCameraActive
---@param bool boolean
---@return void
---@public
function NCSCamera:setCameraActive(bool)
    if self.exist then
        SetCamActive(self.id, true)
        RenderScriptCams(true, bool, 3000, true, false)
    end
end