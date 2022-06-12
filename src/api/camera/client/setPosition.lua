---setPosition
---@param position table<number, number, number>
---@public
function NCSCamera:setPosition(position)
    if (not self.exist) then
        return
    end

    SetCamCoord(self.id, position)
end