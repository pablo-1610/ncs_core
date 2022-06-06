---showTrafficMovie
---@param time number
---@public
function API_Scaleform:showTrafficMovie(time)
    local scaleform <const> = API_Scaleform:requestMovie("TRAFFIC_CAM")
    BeginScaleformMovieMethod(scaleform, "PLAY_CAM_MOVIE")
    EndScaleformMovieMethod()
    while time > 0 do
        Citizen.Wait(1)
        time = time - 0.01
        DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
    end
    SetScaleformMovieAsNoLongerNeeded(scaleform)
end
