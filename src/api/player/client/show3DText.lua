---show3DText
---@param x number
---@param y number
---@param z number
---@param text string
---@param font number
---@param scale number
---@public
function API_Player:show3DText(x, y, z, text, font, scale)
    local onScreen <const>, x <const>, y <const> = World3dToScreen2d(x, y, z)
    if not (scale) then
        scale = 1
    end
    if not (font) then
        font = 4
    end
    if (onScreen) then
        SetTextScale(0.0 * scale, 0.55 * scale)
        SetTextFont(font)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 215)
        SetTextEntry("STRING")
        SetTextCentre(true)
        AddTextComponentString(text)
        DrawText(x, y)
    end
end