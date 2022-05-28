---requestMovie
---@param movie string
---@return scaleform
---@public
function API_Scaleform:requestMovie(movie)
    local scaleform = RequestScaleformMovie(movie)
    while not HasScaleformMovieLoaded(scaleform) do
        Wait(0)
    end
    return (scaleform)
end
