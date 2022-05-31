---requestStrealedTextureDict
---@param textureDict string
---@param callback function
---@public
function API_Streaming:requestStreamedTextureDict(textureDict, callback)
    if not HasStreamedTextureDictLoaded(textureDict) then
        RequestStreamedTextureDict(textureDict)
        while not HasStreamedTextureDictLoaded(textureDict) do
            Wait(0)
        end
        return (textureDict)
    end
end