---clearPed
---@param pedId number
---@public
function API_Ped:clearPed(pedId)
  if (not (DoesEntityExist(pedId))) then
    return NCS:die("Target ped doesn't exist")
  end

  ClearPedProp(pedId,0)
  ClearPedBloodDamage(pedId)
  ClearPedTasksImmediately(pedId)
end