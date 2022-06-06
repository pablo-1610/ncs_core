---addAccount
---@public
---@param self NCSCharacter
---@param accountName string
---@param amount number
function NCSCharacter.addAccount(self, _, accountName, amount)
    if (not self) then
        return NCS:die("Character not found.")
    end

    if (not self.accounts[accountName]) then
        self.accounts[accountName] = 0
    end
    
    self.accounts[accountName] = self.accounts[accountName] + amount
end