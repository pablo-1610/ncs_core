---setHeading
---@param pedId number
---@param heading number
---@return void
---@public
function API_Ped:setHeading(pedId, heading)
    if (not (DoesEntityExist(pedId))) then
        return NCS:die("Target ped doesn't exist")
    end
    
    SetEntityHeading(pedId, heading)
end