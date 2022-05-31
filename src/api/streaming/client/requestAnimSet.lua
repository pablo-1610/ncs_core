---requestAnimSet
---@param textureDict string
---@param callback function
---@public
function API_Streaming:requestAnimSet(animSet, callback)
	if not HasAnimSetLoaded(animSet) then
		RequestAnimSet(animSet)

		while not HasAnimSetLoaded(animSet) do
			Wait(0)
		end
	end
	if callback ~= nil then
		callback()
	end
end
