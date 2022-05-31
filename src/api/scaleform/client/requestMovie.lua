---requestMovie
---@param movieName string
---@return scaleform
---@public
function API_Scaleform:requestMovie(movieName)
    local scaleform = RequestScaleformMovie(movieName)
    while not HasScaleformMovieLoaded(scaleform) do
        Wait(0)
    end
    return (scaleform)
end
