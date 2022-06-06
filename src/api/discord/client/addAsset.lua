---addAsset
---@param name string
---@param text string
---@public
function API_Discord:addAsset(name, text)
   SetDiscordRichPresenceAsset(name)
   SetDiscordRichPresenceAssetText(text)
end