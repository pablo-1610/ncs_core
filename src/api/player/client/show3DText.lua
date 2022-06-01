---show3DText
---@param x number
---@param y number
---@param z number
---@param text string
---@param font number
---@param scale number
---@return void
---@public
function API_Player:show3DText(x, y, z, text, font, scale)
    local onScreen <const>, x <const>, y <const> = GetScreenCoordFromWorldCoord(x, y, z)
    scale = scale or 1
    font = font  or 4
    if (not onScreen) then
        return
    end

    SetTextScale(0.0 * scale, 0.55 * scale)
    SetTextFont(font)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)

    BeginTextCommandDisplayText("STRING")
    AddTextComponentString(text)
    EndTextCommandDisplayText(x, y)
end