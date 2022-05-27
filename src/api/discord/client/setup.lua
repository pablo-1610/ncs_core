---setup
---@param appId number
---@return void
---@public
function API_Discord:setup(appId)
   SetDiscordAppId(appId)
end

---setup
---@param details string
---@return void
---@public
function API_Discord:details(details)
   SetRichPresence(details)
end