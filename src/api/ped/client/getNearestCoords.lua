---getNearestCoords
---@param pedId number
---@param coords table
---@param radius number
---@return any
---@public
function API_Ped:getNearestCoords(pedId, coords, radius)
  if (not (DoesEntityExist(pedId))) then
    return _NCS:die("Target ped does not exists")
  end
  local nearestCoords = API_Ped:getPosition(pedId)
  local currentCoords = radius or 5000

  ---@param v any
  for _, v in pairs(coords) do
    if currentCoords > API_Ped:getDistance(pedId, v) then
      currentCoords = API_Ped:getDistance(pedId, v)
      nearestCoords = v
    end
  end

  return (nearestCoords)
end
