---kill
---@param pedId number
---@return void
---@public
function API_Ped:kill(pedId)
    if (not (DoesEntityExist(pedId))) then
        return NCS:die("Target ped does not exists")
    end

    SetEntityHealth(pedId, 0)
end