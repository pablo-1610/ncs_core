---setMaxHealth
---@param pedId number
---@public
function API_Ped:setMaxHealth(pedId, value)
    if (not (DoesEntityExist(pedId))) then
        return _NCS:die("Target ped does not exists")
    end

    SetEntityMaxHealth(pedId, value)
end