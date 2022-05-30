---setCameraPointAtEntity
---@param Camera NCSCamera
---@param entity number
---@param offsetX number
---@param offsetY number
---@param offsetZ number
---@return void
---@public
function NCSCamera:setCameraPointAtEntity(entity, offsetX, offsetY, offsetZ)
    if self.exist then
        if (not (DoesEntityExist(entity))) then
            return _NCS:die("Target ped does not exists")
        end    
        PointCamAtEntity(self.id, entity, offsetX or .0, offsetY or .0, offsetZ or .0, true)
    end
end
