---setParams
---@param position table<number, number, number>
---@param rotationX number
---@param rotationY number
---@param rotationZ number
---@param fov number
---@public
function NCSCamera:setParams(position, rotationX, rotationY, rotationZ, fov)
    if (not self.exist) then
        return
    end

    SetCamCoord(self.id, position)
    SetCamRot(self.id, rotationX, rotationY, rotationZ, 2)
    SetCamFov(self.id, fov)
end
