NCS:registerNetEvent("setCache", function(cacheType, data)
    MOD_Cache:set(cacheType, data)
end)

CreateThread(function()
    while (true) do
        Wait(1200)
        print(MOD_Cache:exists(NCSEnum.CacheType.PLAYER_DATA))
    end
end)