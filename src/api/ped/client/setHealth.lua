---setHealth
---@param pedId number
---@param value number
---@public
function API_Ped:resetAlpha(pedId, value)
    if (not (DoesEntityExist(pedId))) then
        return _NCS:die("Target ped does not exists")
    end

    SetEntityHealth(pedId, value)
end