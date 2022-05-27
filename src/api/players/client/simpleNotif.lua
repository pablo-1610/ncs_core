---simpleNotif
---@param text string
---@param colorBg number
---@public

function _NCS:simpleNotif(text, colorBg)
    if colorBg then ThefeedNextPostBackgroundColor(colorBg) end
	AddTextEntry('SowNotifSimple', text)
	BeginTextCommandThefeedPost('SowNotifSimple')
	EndTextCommandThefeedPostTicker(false, false)
end