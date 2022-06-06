---setAccount
---@public
---@param self NCSCharacter
---@param accountName string
---@param amount number
function NCSCharacter.setAccount(self, _, accountName, amount)
    if (not self) then
        return NCS:die("Character not found.")
    end

    if (not self.accounts[accountName]) then
        self.accounts[accountName] = 0
    end
    
    self.accounts[accountName] = amount
end