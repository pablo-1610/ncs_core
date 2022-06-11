---setPosition
---@param coords table<number, number, number>
---@public
function NCSCamera:setPosition(coords)
    if (not self.exist) then
        return
    end

    SetCamCoord(self.id, coords)
end