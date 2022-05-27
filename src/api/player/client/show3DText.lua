---show3dtext
---@param x number
---@param y number
---@param z number
---@param text string
function API_Player:show3dtext = function(x, y, z, text)
    local onScreen, x, y = World3dToScreen2d(x, y, z)
    if onScreen then
        SetTextScale(0.90, 0.90)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 215)
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(x, y)
    end
end