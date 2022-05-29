ncs_Blips = {}
ncs_Blips.__index = ncs_Blips

local defaultParams = {
    sprite = 66,
    color = 5,
    display = 0, 
    scale = 0.8,
    range = true,
    label = "NCS_BLIPS_DEFAULT_LABEL",
}

--- createBlip
---@param params table coords, sprite, color, display, scale, range, label
---@return Blips
---@public
function API_Player:createBlip(params)
    if type(params) ~= 'table' then
        return
    end
      
    local self = {}

    self.coords = params.coords or self.coords
    self.sprite = params.sprite or defaultParams.sprite
    self.color = params.color or defaultParams.color
    self.display = params.display or defaultParams.display
    self.scale = params.scale or defaultParams.scale
    self.range = params.range or defaultParams.range
    self.label = params.label or defaultParams.label

    self.id = AddBlipForCoord(self.coords)
    self.exist = DoesBlipExist(self.id)
    SetBlipSprite(self.id, self.sprite)
    SetBlipHighDetail(self.id, true)
    SetBlipColour(self.id, self.color)
    SetBlipDisplay(self.id, self.display)
    SetBlipScale(self.id, self.scale)
    SetBlipAsShortRange(self.id, self.range)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentSubstringPlayerName(self.label)
    EndTextCommandSetBlipName(self.id)

    return setmetatable(self, ncs_Blips)
end
