--- create npc
---@param pedType number
---@param modelHash string
---@param coords table
---@param heading number
---@public

function API_NPC:createNPC(pedType, modelHash, coords, heading)
    local ped = CreatePed(pedType, modelHash, coords.x, coords.y, coords.z, heading, true, true)
    FreezeEntityPosition(ped, true)
end

RegisterCommand('test1', function()
    API_NPC:createNPC(4, 'a_m_m_business_01', {x = -241.82, y = -984.22, z = 28.29}, 250.02)
end)