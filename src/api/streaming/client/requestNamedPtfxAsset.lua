---requestNamedPtfxAsset
---@param assetName string
---@return string
---@public
function API_Streaming:requestNamedPtfxAsset(assetName)
    if (HasNamedPtfxAssetLoaded(assetName)) then
        return (assetName)
    end
    
    RequestNamedPtfxAsset(assetName)
    while (not HasNamedPtfxAssetLoaded(assetName)) do
        Wait(0)
    end
    return (assetName)
end