---requestStrealedTextureDict
---@param textureDict string
---@return string
---@public
function API_Streaming:requestStreamedTextureDict(textureDict)
    if (not HasStreamedTextureDictLoaded(textureDict)) then
        RequestStreamedTextureDict(textureDict)
        while (not HasStreamedTextureDictLoaded(textureDict)) do
            Wait(0)
        end
        return (textureDict)
    end
end