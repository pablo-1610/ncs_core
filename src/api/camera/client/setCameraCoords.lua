---setCameraActive
---@param coords table<number, number, number>
---@return void
---@public
function NCSCamera:setCameraCoords(coords)
    if self.exist then
        SetCamCoord(self.id, coords)
    end
end