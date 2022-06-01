---getClosetPed
---@return number
---@public
function API_Ped:getClosetPed()
    local peds, ped = API_Ped:getAllPeds(), 0

    table.sort(peds, function(a, b) return a.distance < b.distance end)
    for i = 1, #peds do
        ped, dist = peds[i].ped, peds[i].distance
        if not IsPedAPlayer(ped) and not IsPedDeadOrDying(ped) then 
            break 
        end
    end
    return ped
end