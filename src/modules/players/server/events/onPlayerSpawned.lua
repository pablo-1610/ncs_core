AddEventHandler("playerSpawned", function()
    local _src <const> = source
    MOD_Players:set(_src, NCSPlayer(_src))
end)