---removeAccount
---@public
---@param self NCSCharacter
---@param accountName string
---@param amount number
function NCSCharacter.removeAccount(self, _, accountName, amount)
    if (not self) then
        return NCS:die("Character not found.")
    end

    if (not self.accounts[accountName]) then
        return NCS:die("Account not found.")
    end
    amount = (amount or 0)
    if (self.accounts[accountName] - amount < 0) then
        return NCS:die("Not enough money.")
    end

    self.accounts[accountName] = self.accounts[accountName] - amount
end