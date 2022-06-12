---setPointAtEntity
---@param entityId number
---@param offsetX number
---@param offsetY number
---@param offsetZ number
---@public
function NCSCamera:setPointAtEntity(entityId, offsetX, offsetY, offsetZ)
    if (not self.exist) then
        return
    end
    if (not (DoesEntityExist(entityId))) then
        return NCS:die("Target entity does not exists")
    end

    PointCamAtEntity(self.id, entityId, offsetX or .0, offsetY or .0, offsetZ or .0, true)
end
