---getNearestCoords
---@param pedId number
---@param coords table
---@param radius number
---@return vector3
---@public

function API_Ped:getNearestCoords(pedId, coords, radius)
  local nearestCoords <const> = API_Ped:getPosition(pedId)
  local currentCoords <const> = radius or 5000
  
  for _, v in pairs(coords) do         
    if currentCoords > API_Ped:getDistance(pedId, v) then
      currentCoords = API_Ped:getDistance(pedId, v)
      nearestCoords = v
    end
  end
 
  return nearestCoords
end
