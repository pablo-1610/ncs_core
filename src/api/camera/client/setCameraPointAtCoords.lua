---setCameraPointAtCoords
---@param Camera NCSCamera
---@param coords table
---@return void
---@public
function NCSCamera:setCameraPointAtCoords(coords)
    if self.exist then
        PointCamAtCoord(self.id, coords)
    end
end