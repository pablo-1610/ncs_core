---kickPlayer
---@param playerSrc number
---@param reason string
---@return void
---@public
function API_Player:kickPlayer(playerSrc, reason)
    local playerData <const> = MOD_Players:get(playerSrc)
    if (playerData) then
        MOD_Players:remove(playerData)
    end
    DropPlayer(playerSrc, (reason or _Literals.KICK_DEFAULT_MESSAGE))
end