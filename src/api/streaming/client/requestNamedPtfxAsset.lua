---requestNamedPtfxAsset
---@param assetName string
---@param callback function
---@return assetName
---@public
function API_Streaming:requestNamedPtfxAsset(assetName)
    if (not HasNamedPtfxAssetLoaded(assetName)) then
        RequestNamedPtfxAsset(assetName)
        while (not HasNamedPtfxAssetLoaded(assetName)) do
            Wait(0)
        end
        return (assetName)
    end
end