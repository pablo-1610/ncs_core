AddEventHandler("playerDropped", function()
    local _src <const> = source
    MOD_Players:remove(_src)
end)