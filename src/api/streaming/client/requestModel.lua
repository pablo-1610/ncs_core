---requestModel
---@param modelHash string
---@param callback function
---@public
function API_Streaming:requestModel(modelHash, callback)
	modelHash = (type(modelHash) == 'number' and modelHash or GetHashKey(modelHash))
	if not HasModelLoaded(modelHash) and IsModelInCdimage(modelHash) then
		RequestModel(modelHash)

		while not HasModelLoaded(modelHash) do
			Wait(0)
		end
	end
	if callback ~= nil then
		callback()
	end
end