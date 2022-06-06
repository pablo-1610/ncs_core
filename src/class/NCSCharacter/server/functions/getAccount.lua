---getAccount
---@public
---@return number
---@param self NCSCharacter
---@param accountName string
function NCSCharacter.getAccount(self, _, accountName)
    if (not self) then
        return NCS:die("Character not found.")
    end

    if (not self.accounts[accountName]) then
        return NCS:die("Account not found.")
    end
    
    return self.accounts[accountName]
end