---addFirstAction
---@param label string
---@param url string
---@public
function API_Discord:addFirstAction(label, url)
   SetDiscordRichPresenceAction(0, label, url)
end