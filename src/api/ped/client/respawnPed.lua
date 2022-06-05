---respawnped
---@param ped string
---@param coords table
---@param heading number
---@public
function API_PED:respawnPed(ped, coords, heading)
	SetEntityCoordsNoOffset(ped, coords.x, coords.y, coords.z, false, false, false)
	NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, heading, true, false)
	API_Ped:setInvincible(ped, false)
	ClearPedBloodDamage(ped)
end