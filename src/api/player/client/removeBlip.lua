---removeBlip
---Removes a blip from the player's screen.
---@param Blips Prefix. The blip to remove.
---@return void
---@public
function ncs_Blips:removeBlip()
    if self.exist then
        RemoveBlip(self.id)
    end
end
