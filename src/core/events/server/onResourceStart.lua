AddEventHandler("onResourceStart", function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end

    PerformHttpRequest("https://raw.githubusercontent.com/NextCitizens/ncs_core/main/fxmanifest.lua", function (_, resultData, _)
        local currentVersion <const> = GetResourceMetadata(GetCurrentResourceName(), "version")
        local lines = {}

        for s in resultData:gmatch("[^\r\n]+") do
            table.insert(lines, s)
        end

        local ver <const> = API_Strings:split(lines[6], "'")[2]

        if (not (currentVersion == ver)) then
            _NCS:coreTrace("NCS Core has not up to date ^3please update -> https://github.com/NextCitizens/ncs_core ^7!", _NCSEnum.LogType.ERROR)
        end
    end)

    _NCS:coreTrace("NCS Core has been ^2started ^7!", _NCSEnum.LogType.INFO)
    _NCS:triggerEvent("ncs_core:loaded")
end)
