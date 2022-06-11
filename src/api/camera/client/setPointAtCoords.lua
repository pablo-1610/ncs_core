---setPointAtCoords
---@param position table<number, number, number>
---@public
function NCSCamera:setPointAtCoords(position)
    if (not self.exist) then
        return
    end

    PointCamAtCoord(self.id, position)
end