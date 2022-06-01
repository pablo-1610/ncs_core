---getClosetPed
---@return number
---@public
function API_Ped:getClosetPed()
    local peds, ped = API_Ped:getAllPeds(), 0

    table.sort(peds, function(a, b) return a.distance < b.distance end)
    for i = 1, #peds do
        local dist <const> = peds[i].distance
        ped = peds[i].ped
        if not IsPedAPlayer(ped) and not IsPedDeadOrDying(ped) then
            break
        end
    end
    return (ped)
end