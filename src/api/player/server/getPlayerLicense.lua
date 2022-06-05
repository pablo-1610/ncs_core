---getLicense
---@param playerSrc number
---@return string
---@public
function API_Player:getLicense(playerSrc)
    if (not playerSrc or playerSrc <= 0) then
        return NCS:die('Unable to find license : source is invalid')
    end
    for _, v in pairs(GetPlayerIdentifiers(playerSrc)) do
        if (string.sub(v, 1, string.len("license:")) == "license:") then
            return (v)
        end
    end
    return (false)
end