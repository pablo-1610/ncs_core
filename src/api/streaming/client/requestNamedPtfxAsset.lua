---requestNamedPtfxAsset
---@param assetName string
---@return string
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