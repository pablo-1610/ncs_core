---showTrafficMovie
---@param sec number
---@return void
---@public
function API_Scaleform:showTrafficMovie(sec)
    local scaleform = API_Scaleform:requestMovie("TRAFFIC_CAM")
    BeginScaleformMovieMethod(scaleform, "PLAY_CAM_MOVIE")
    EndScaleformMovieMethod()
    while sec > 0 do
        Citizen.Wait(1)
        sec = sec - 0.01
        DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
    end
    SetScaleformMovieAsNoLongerNeeded(scaleform)
end
