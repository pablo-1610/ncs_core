---setCameraParams
---@param coords table<number, number, number>
---@param rotationX number
---@param rotationY number
---@param rotationZ number
---@param fov number
---@return void
---@public
function NCSCamera:setCameraParams(coords, rotationX, rotationY, rotationZ, fov)
    if self.exist then
        SetCamCoord(self.id, coords)
        SetCamRot(self.id, rotationX, rotationY, rotationZ, 2)
        SetCamFov(self.id, params.fov)
    end
end
