---clearPed
---@param pedId number
---@return number
---@public
function API_Ped:clearPed(pedId)
  if (not (DoesEntityExist(pedId))) then
    return _NCS:die("Target ped does not exists")
  end
  ClearPedProp(pedId,0)
  ClearPedBloodDamage(pedId)
  ClearPedTasksImmediately(pedId)
end