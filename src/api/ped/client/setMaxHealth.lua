---setMaxHealth
---@param pedId number
---@param value number
---@return void
---@public
function API_Ped:setMaxHealth(pedId, value)
    if (not (DoesEntityExist(pedId))) then
        return NCS:die("Target ped doesn't exist")
    end

    SetEntityMaxHealth(pedId, value)
end