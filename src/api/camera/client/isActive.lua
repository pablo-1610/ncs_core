---isActive
---@return boolean
---@public
function NCSCamera:isActive()
    if (not self.exist) then
        return
    end

    return IsCamActive(self.id)
end