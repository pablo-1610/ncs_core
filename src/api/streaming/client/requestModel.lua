---requestModel
---@param modelHash string
---@return number
---@public
function API_Streaming:requestModel(modelHash)
    if (not (IsModelInCdimage(modelHash))) then
        return (_NCS:die("Model not found: " .. modelHash))
    end
    modelHash = (type(modelHash) == "number" and modelHash or GetHashKey(modelHash))
    if (not HasModelLoaded(modelHash)) then
        RequestModel(modelHash)
        while (not HasModelLoaded(modelHash)) do
            Wait(0)
        end
        return (modelHash)
    end
end