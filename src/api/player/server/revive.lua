---revive
---@param PlayerId number
---@public
function API_Player:revive(PlayerId)
    local coords = GetEntityCoords(GetPlayerPed(PlayerId))
    NCSPlayer.setDeathStatus(PlayerId, 0, nil)

    DoScreenFadeOut(800)

	while not IsScreenFadedOut() do
		Wait(50)
	end

	local formattedCoords = {
		position = vector3( 
			API_Maths.round(coords.x, 1), 
			API_Maths.round(coords.y, 1), 
			API_Maths.round(coords.z, 1) 
			),
		heading = 0.0
	}

	API_Player:spawn(formattedCoords)

	DoScreenFadeIn(800)
end