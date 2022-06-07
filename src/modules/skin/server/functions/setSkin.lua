---setSkin
---@param skinTable table
---@param save boolean
---@public
function MOD_Skin:setSkin(playerId, skinTable, save)
    local skinToApply = MOD_Players:get(playerId).character.skin
    for index, value in pairs(skinTable) do
        skinToApply[index] = value
    end

    NCS:triggerClientEvent("setSkin", skinToApply, save)

    if save then
        MOD_Players:get(playerId).character.skin = skinToApply
    end
end