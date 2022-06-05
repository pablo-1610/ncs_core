---addSmallAsset
---@param name string
---@param text string
---@public
function API_Discord:addSmallAsset(name, text)
   SetDiscordRichPresenceAssetSmall(name)
   SetDiscordRichPresenceAssetSmallText(text)
end