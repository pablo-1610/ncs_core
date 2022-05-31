_NCS:registerNetEvent("NCs_player:setPlayerBucket")
_NCS:handleEvent("NCs_player:setPlayerBucket", function(bucket)
    local _src <const> = source
    MOD_Players:get(_src):setBucket(bucket)
end)