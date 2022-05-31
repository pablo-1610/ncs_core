---getFuel
---@param vehicle entity
---@public
function API_Vehicles:getFuel(vehicle)
	return DecorGetFloat(vehicle, "_FUEL_LEVEL")
end