---showBigFreemodeMessage
---@param title string
---@param message string
---@param time number
---@public
function API_Scaleform:showBigFreemodeMessage(title, message, time)
    local scaleform = API_Scaleform:requestMovie("MP_BIG_MESSAGE_FREEMODE")
    BeginScaleformMovieMethod(scaleform, "SHOW_SHARD_WASTED_MP_MESSAGE")
    ScaleformMovieMethodAddParamTextureNameString(title)
    ScaleformMovieMethodAddParamTextureNameString(message)
    EndScaleformMovieMethod()
    while time > 0 do
        Citizen.Wait(1)
        time = time - 0.01
        DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
    end
    SetScaleformMovieAsNoLongerNeeded(scaleform)
end
