---missionNotif
---@param text string
---@param time number
---@public

function _NCS:missionNotif(text, time)
	ClearPrints()
	BeginTextCommandPrint('STRING')
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandPrint(time, true)
end
