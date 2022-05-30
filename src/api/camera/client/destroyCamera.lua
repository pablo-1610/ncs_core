---destroyCamera
---@param Camera NCSCamera
---@param bool boolean
---@return void
---@public
function NCSCamera:destroyCamera(bool)
    if self.exist then
    	SetCamActive(self.id, false)
        RenderScriptCams(false, bool, 3000, true, true)
        DestroyCam(self.id, false)
    end
end
