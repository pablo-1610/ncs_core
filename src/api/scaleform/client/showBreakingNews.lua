---showBreakingNews
---@param title string
---@param message string
---@param bottom string
---@param sec number
---@return void
---@public
function API_Scaleform:showBreakingNews(title, message, bottom, sec)
    local scaleform = API_Scaleform:requestMovie("BREAKING_NEWS")
    BeginScaleformMovieMethod(scaleform, "SET_TEXT")
    ScaleformMovieMethodAddParamTextureNameString(message)
    ScaleformMovieMethodAddParamTextureNameString(bottom)
    EndScaleformMovieMethod()
    BeginScaleformMovieMethod(scaleform, "SET_SCROLL_TEXT")
    ScaleformMovieMethodAddParamInt(0)
    ScaleformMovieMethodAddParamInt(0)
    ScaleformMovieMethodAddParamTextureNameString(title)
    EndScaleformMovieMethod()
    BeginScaleformMovieMethod(scaleform, "DISPLAY_SCROLL_TEXT")
    ScaleformMovieMethodAddParamInt(0)
    ScaleformMovieMethodAddParamInt(0)
    EndScaleformMovieMethod()
    while sec > 0 do
        Wait(1)
        sec = sec - 0.01
        DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
    end
    SetScaleformMovieAsNoLongerNeeded(scaleform)
end
