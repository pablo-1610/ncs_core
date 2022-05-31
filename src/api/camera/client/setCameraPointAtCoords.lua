---setCameraPointAtCoords
---@param coords table<number, number, number>
---@return void
---@public
function NCSCamera:setCameraPointAtCoords(coords)
    if self.exist then
        PointCamAtCoord(self.id, coords)
    end
end