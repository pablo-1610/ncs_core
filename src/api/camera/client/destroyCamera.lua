---destroyCamera
---@return void
---@public
function NCSCamera:destroyCamera()
    if self.exist then
    	SetCamActive(self.id, false)
        RenderScriptCams(false, true, 3000, true, true)
        DestroyCam(self.id, false)
    end
end
