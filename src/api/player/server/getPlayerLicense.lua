---getLicense
---@param playerId number
---@return string
---@public
function API_Player:getLicense(playerId)
    for _, v in pairs(GetPlayerIdentifiers(playerId)) do
        if (string.sub(v, 1, string.len("license:")) == "license:") then
            return (v)
        end
    end
    return (false)
end

function API_Player:test()
    print("ok")
end