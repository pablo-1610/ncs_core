---getClosestPlayer
---@return void
---@public
function _NCS:getClosestPlayer()
    local players = GetActivePlayers()
    local coords = GetEntityCoords(PlayerPedId())
    local pCloset = nil
    local playerClosetPosition = nil
    local playerClosestDistance = nil
    for k,v in pairs(players) do
        if (GetPlayerPed(v) ~= PlayerPedId()) then
            local oPed = GetPlayerPed(v)
            local oCoords = GetEntityCoords(oPed)
            local dst = GetDistanceBetweenCoords(oCoords, coords, true)
            if (pCloset == nil) then
                pCloset = v
                playerClosetPosition = oCoords
                playerClosestDistance = dst
            else
                if (dst < playerClosestDistance) then
                    pCloset = v
                    playerClosetPosition = oCoords
                    playerClosestDistance = dst
                end
            end
        end
    end
    return pCloset, playerClosestDistance
end