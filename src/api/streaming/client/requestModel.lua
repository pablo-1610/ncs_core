---requestModel
---@param modelHash string
---@param callback function
---@public
function API_Streaming:requestModel(modelHash, callback)
    if (not (IsModelInCdimage(modelHash))) then
        return _NCS:die("Model not found: " .. modelHash)
    end
    modelHash = (type(modelHash) == 'number' and modelHash or GetHashKey(modelHash))
    if not HasModelLoaded(modelHash) then
        RequestModel(modelHash)
        while not HasModelLoaded(modelHash) do
            Wait(0)
        end
    end
    if callback ~= nil then
        callback()
    end
end