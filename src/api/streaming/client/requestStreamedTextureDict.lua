---requestStrealedTextureDict
---@param textureDict string
---@return string
---@public
function API_Streaming:requestStreamedTextureDict(textureDict)
    if (HasStreamedTextureDictLoaded(textureDict)) then
        return (textureDict)
    end
    
    RequestStreamedTextureDict(textureDict)
    while (not HasStreamedTextureDictLoaded(textureDict)) do
        Wait(0)
    end
    return (textureDict)
end