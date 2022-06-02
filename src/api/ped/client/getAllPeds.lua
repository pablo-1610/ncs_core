---getAllPeds
---@return table
---@public
function API_Ped:getAllPeds()
    local peds <const> = {}
    local PedPool <const> = GetGamePool("CPed")
    local playerCoords <const> = GetEntityCoords(PlayerPedId())

    for i = 1, #PedPool do
        local ped <const> = PedPool[i]
        local distance <const> = #(playerCoords - GetEntityCoords(ped))
        peds[#peds + 1] = { ped = ped, distance = distance }
    end
    return (peds)
end