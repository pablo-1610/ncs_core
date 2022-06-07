NCS:registerNetEvent("savePlayerSkin")
NCS:handleEvent("savePlayerSkin", function(skin)
    local _src <const> = source
    MOD_Players:get(_src).character.skin = skin
end)