---show3DText
---@param x number
---@param y number
---@param z number
---@param text string
---@return void
---@public
function API_Player:show3DText(x, y, z, text)
    local onScreen, x, y = World3dToScreen2d(x, y, z)
    if (onScreen) then
        -- TODO : Draw text
    end
end