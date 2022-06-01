---kickPlayer
---@param playerSrc number
---@return void
---@public
function API_Player:kickPlayer(playerSrc, reason)
    reason = (reason or _Literals.KICK_DEFAULT_MESSAGE)
    if (playerSrc) then
        DropPlayer(playerSrc, reason)
    end
    CreateThread(function()
        while (true) do 
            if (GetPlayerPing(playerSrc) >= 0) then
                break
            end
            Wait(200)
            DropPlayer(playerSrc, reason)
        end
    end)
end