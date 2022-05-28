--- create Blip
---@param blip_name string
---@param blip_coords table
---@param blip_sprite number
---@param blip_display number
---@param blip_color number
---@param blip_scale number
---@public

function API_Blip:createBlip(blip_name, blip_coords, blip_sprite, blip_display, blip_scale, blip_color)
    Blip = AddBlipForCoord(blip_coords.x, blip_coords.y, blip_coords.z)

    SetBlipSprite(Blip, blip_sprite)
    SetBlipDisplay(Blip, blip_display)
    SetBlipScale(Blip, blip_scale)
    SetBlipColour(Blip, blip_color)

    SetBlipAsShortRange(Blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(blip_name)
    EndTextCommandSetBlipName(Blip)
end

RegisterCommand("test_blip", function()
    API_Blip:createBlip("test", {x = -1039.9, y = -2737.1, z = 20.8}, 1, 2, 0.5, 1)
end)