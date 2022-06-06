---disconnect
---@public
---@param self NCSPlayer
function NCSPlayer.disconnect(self)
    self:save()

    if (self.character and self.inGame) then
        self.character:savePosition()
        self.character:saveAccounts()
        --self.character:save()
    end
end