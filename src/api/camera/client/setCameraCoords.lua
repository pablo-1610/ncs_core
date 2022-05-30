---setCameraActive
---@param Camera NCSCamera
---@param coords table
---@return void
---@public
function NCSCamera:setCameraCoords(coords)
    if self.exist then
        SetCamCoord(self.id, coords)
    end
end