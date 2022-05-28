---clientCreateCheckpoint
---@param id number
---@param x number
---@param y number
---@param z number
---@return void
---@public
function API_Objects:clientCreateCheckpoint(id,x,y,z,r,g,b,a,h1,h2,h3)
    local checkpoint = CreateCheckpoint(id, x,y,z, 0.0,0.0,0.0, 2.0, r,g,b, a, nil)
    SetCheckpointCylinderHeight(checkpoint, h1,h2,h3)
end