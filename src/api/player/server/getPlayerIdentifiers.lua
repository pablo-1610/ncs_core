---getIdentifiers
---@param playerSrc number
---@return table
---@public
function API_Player:getIdentifiers(playerSrc)
    local identifiers = {}
    for _, v in pairs(GetPlayerIdentifiers(playerSrc)) do
        if string.sub(v, 1, string.len("steam:")) == "steam:" then
            identifiers["steamid"] = v
        elseif string.sub(v, 1, string.len("license:")) == "license:" then
            identifiers["license"] = v
        elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
            identifiers["xbl"]  = v
        elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
            identifiers["ip"] = v
        elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
            identifiers["discord"] = v
        elseif string.sub(v, 1, string.len("live:")) == "live:" then
            identifiers["live"] = v
        end
    end
    return (identifiers)
end