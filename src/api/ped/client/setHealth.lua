---setHealth
---@param pedId number
---@param value number
---@return void
---@public
function API_Ped:setHealth(pedId, value)
    if (not (DoesEntityExist(pedId))) then
        return NCS:die("Target ped does not exists")
    end

    SetEntityHealth(pedId, value)
end