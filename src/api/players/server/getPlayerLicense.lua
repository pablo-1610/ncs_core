---getPlayerLicense
---@param playerId number
---@return string
---@public
function _NCS:getPlayerLicense(playerId)
    for _, v in pairs(GetPlayerIdentifiers(playerId)) do
        if (string.sub(v, 1, string.len("license:")) == "license:") then
            return (v)
        end
    end
    return (false)
end
