---addFirstAction
---@param label string
---@param url string
---@return void
---@public
function API_Discord:addFirstAction(label, url)
   SetDiscordRichPresenceAction(0, label, url)
end

---addSecondAction
---@param label string
---@param url string
---@return void
---@public
function API_Discord:addSecondAction(label, url)
   SetDiscordRichPresenceAction(1, label, url)
end