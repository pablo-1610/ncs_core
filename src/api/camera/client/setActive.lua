---setActive
---@param state boolean
---@public
function NCSCamera:setActive(state)
    if (not self.exist) then
        return
    end

    SetCamActive(self.id, true)
    RenderScriptCams(true, state, 3000, true, false)
end