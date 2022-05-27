---@class npc
---@param ped_type number
---@param modelhash string
---@param coords table
---@param heading number
---@public
npc = {}
function npc:createped(ped_type, modelhash, coords, heading)
    self.pedtype = ped_type
    self.modelhash = modelhash
    self.coords = coords
    self.heading = heading
    self.ped = CreatePed(self.pedtype, self.modelhash, self.coords.x, self.coords.y, self.coords.z, self.heading, false, true)
end

