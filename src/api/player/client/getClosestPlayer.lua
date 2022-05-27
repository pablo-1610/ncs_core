---getClosest
---@return number, number
---@public
function API_Player:getClosest()
    local players, coords, playerClosest, playerClosestPosition, playerClosestDistance = GetActivePlayers(), GetEntityCoords(PlayerPedId())
    for _, v in pairs(players) do
        if (GetPlayerPed(v) ~= PlayerPedId()) then
            local oPed = GetPlayerPed(v)
            local oCoords = GetEntityCoords(oPed)
            local dst = #(oCoords - coords)
            if not (playerClosest) then
                playerClosest = v
                playerClosestPosition = oCoords
                playerClosestDistance = dst
            else
                if (dst < playerClosestDistance) then
                    playerClosest = v
                    playerClosestPosition = oCoords
                    playerClosestDistance = dst
                end
            end
        end
    end
    return (playerClosest), (playerClosestDistance)
end