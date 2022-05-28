---create Blip
---@param blip_name string
---@param blip_coords table
---@param blip_sprite number
---@param blip_display number
---@param blip_color number
---@param blip_scale number
---@return void
---@public

function API_Blip:createBlip(blip_name, blip_coords, blip_sprite, blip_display, blip_scale, blip_color)
    _NCS:triggerClientEvent('API_Blip:customBlip', -1, blip_name, blip_coords, blip_sprite, blip_display, blip_scale, blip_color)
end