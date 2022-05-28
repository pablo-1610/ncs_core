---addSmallAsset
---@param name string
---@param text string
---@return void
---@public
function API_Discord:addSmallAsset(name, text)
   SetDiscordRichPresenceAssetSmall(name)
   SetDiscordRichPresenceAssetSmallText(text)
end