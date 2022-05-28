---showBigFreemodeMessage
---@param title string
---@param message string
---@param sec number
---@return void
---@public
function API_Scaleform:showBigFreemodeMessage(title, message, sec)

    local scaleform = API_Scaleform:requestMovie("MP_BIG_MESSAGE_FREEMODE")

    BeginScaleformMovieMethod(scaleform, 'SHOW_SHARD_WASTED_MP_MESSAGE')
    ScaleformMovieMethodAddParamTextureNameString(title)
    ScaleformMovieMethodAddParamTextureNameString(message)
    EndScaleformMovieMethod()

    while sec > 0 do
        Citizen.Wait(1)
        sec = sec - 0.01
        DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
    end

    SetScaleformMovieAsNoLongerNeeded(scaleform)
end