---requestModel
---@param modelHash string
---@return number
---@public
function API_Streaming:requestModel(modelHash)
    modelHash = (type(modelHash) == "number" and modelHash or GetHashKey(modelHash))
    if (not (IsModelInCdimage(modelHash))) then
        return (NCS:die("Model not found: " .. modelHash))
    end
    if (HasModelLoaded(modelHash)) then
        return (modelHash)
    end

    RequestModel(modelHash)
    while (not HasModelLoaded(modelHash)) do
        Wait(0)
    end
    return (modelHash)
end