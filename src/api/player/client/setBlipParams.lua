---setBlipParams
---@param Blips Prefix. The blip to set the params for.
---@param params table coords, sprite, color, display, scale, range, label
---@return void
---@public
function ncs_Blips:setBlipParams(params)
    if self.exist then
        self:removeBlip()
        self.id = AddBlipForCoord(params.coords or self.coords)
        SetBlipSprite(self.id, params.sprite or self.sprite)
        SetBlipDisplay(self.id, params.display  or self.display)
        SetBlipColour(self.id, params.color or self.color)
        SetBlipScale(self.id, params.scale or self.scale)
        SetBlipAsShortRange(self.id, params.range or self.range)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentSubstringPlayerName(params.label or self.label)
        EndTextCommandSetBlipName(self.id)
    end
end
