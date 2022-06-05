---revive
---@param PlayerId number
---@public
function API_Player:revive(PlayerId)
    local PlayerPed = GetPlayerPed(PlayerId)
    local coords = GetEntityCoords(playerPed)
    NCSPlayer.setDeathStatus(PlayerId, 0, nil)

    DoScreenFadeOut(800)

	while not IsScreenFadedOut() do
		Wait(50)
	end

	local formattedCoords = {
		x = API_Maths.round(coords.x, 1),
		y = API_Maths.round(coords.y, 1),
		z = API_Maths.round(coords.z, 1)
	}

	RespawnPed(playerPed, formattedCoords, 0.0)

	DoScreenFadeIn(800)
end