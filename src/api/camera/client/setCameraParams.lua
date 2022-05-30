---setCameraParams
---@param Camera NCSCamera
---@param params table coords.x, coords.y, coords.z, rotation.x, rotation.y, rotation.z, fov
---@return void
---@public
function NCSCamera:setCameraParams(params)
    if self.exist then
        if params.coords then
            SetCamCoord(self.id, params.coords)
        end
        if params.rotation then
            SetCamRot(self.id, params.rotation, 2)
        end
        if params.fov then
            SetCamFov(self.id, params.fov)
        end
    end
end