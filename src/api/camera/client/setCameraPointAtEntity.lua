---setCameraPointAtEntity
---@param entityId number
---@param offsetX number
---@param offsetY number
---@param offsetZ number
---@return void
---@public
function NCSCamera:setCameraPointAtEntity(entityId, offsetX, offsetY, offsetZ)
    if self.exist then
        if (not (DoesEntityExist(entityId))) then
            return NCS:die("Target entity does not exists")
        end    
        PointCamAtEntity(self.id, entityId, offsetX or .0, offsetY or .0, offsetZ or .0, true)
    end
end
