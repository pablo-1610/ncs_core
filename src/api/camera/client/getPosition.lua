---getPosition
---@return table<number, number, number>
---@public
function NCSCamera:getPosition()
    if (not self.exist) then
        return
    end

    return GetCamCoord(self.id)
end