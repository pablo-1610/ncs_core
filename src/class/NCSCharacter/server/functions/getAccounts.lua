---getAccounts
---@public
---@return number
---@param self NCSCharacter
function NCSCharacter.getAccounts(self)
    if (not self) then
        return NCS:die("Character not found.")
    end
    
    return self.accounts
end