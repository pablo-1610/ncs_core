---kickPlayer
---@param playerSrc number
---@return void
---@public
function API_Player:kickPlayer(playerSrc, reason)
    DropPlayer(playerSrc, (reason or _Literals.KICK_DEFAULT_MESSAGE))
end