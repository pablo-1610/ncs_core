---getAllPeds
---@return table
---@public
function API_Ped:getAllPeds()
    local peds = {}
    local PedPool = GetGamePool("CPed")
    local player = PlayerPedId()

    for i = 1, #PedPool do
        ped = PedPool[i]
        local distance = #(GetEntityCoords(player) - GetEntityCoords(ped))
        peds[#peds + 1] = {ped = ped, distance = distance}
    end
    return peds
end