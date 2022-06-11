---destroy
---@public
function NCSCamera:destroy()
    if not self.exist then
        return
    end
    
    SetCamActive(self.id, false)
    RenderScriptCams(false, true, 3000, true, true)
    DestroyCam(self.id, false)
end
