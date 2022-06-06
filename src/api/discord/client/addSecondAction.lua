---addSecondAction
---@param label string
---@param url string
---@public
function API_Discord:addSecondAction(label, url)
   SetDiscordRichPresenceAction(1, label, url)
end