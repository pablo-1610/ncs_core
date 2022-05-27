---HelpNotif
---@param text string
---public

function _NCS:HelpNotif(text)
    AddTextEntry('HELP', text)
    DisplayHelpTextThisFrame('HELP', false)
end

---Notif
---@param text string
---@param colorBg number
---public

function _NCS:Notif(text, colorBg)
    if colorBg then ThefeedNextPostBackgroundColor(colorBg) end
	AddTextEntry('SowNotifSimple', text)
	BeginTextCommandThefeedPost('SowNotifSimple')
	EndTextCommandThefeedPostTicker(false, false)
end

---IconNotif
---@param icon string
---@param type number
---@param sender string
---@param title string
---@param text string
---@param colorBg number
---public

function _NCS:IconNotif(icon, type, sender, title, text, colorBg)--( logo, 1, expediteur, objet, message)
    if colorBg then ThefeedNextPostBackgroundColor(colorBg) end
	SetNotificationTextEntry("STRING");
	AddTextComponentString(text);
	SetNotificationMessage(icon, icon, true, type, sender, title, text);
	DrawNotification(false, true);
end

---MissionNotif
---@param text string
---@param time number
---public

function _NCS:MissionNotif(text, time)
	ClearPrints()
	BeginTextCommandPrint('STRING')
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandPrint(time, true)
end
