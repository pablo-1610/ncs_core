---setSkin
---@param skinTable table
---@param save boolean
---@public
function MOD_Skin:setSkin(playerId, skinTable, save)
    local skinToApply = MOD_Players:get(playerId).character.skin
    for index, value in pairs(skinTable) do
        skinToApply[index] = value
    end

    local bagsWeight = NCSConstant.bagsWeight[skinToApply["bags_1"]]

    MOD_Players:get(playerId).character:setMaxWeight(bagsWeight or GetConvarInt("ncs_default_max_weight", 20))

    NCS:triggerClientEvent("setSkin", playerId, skinToApply)

    if save then
        MOD_Players:get(playerId).character.skin = skinToApply
    end
end