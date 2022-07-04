----hasAccount
---@param account number
---@public
---@return void
function NCSCharacter:hasAccount(account)
    if (not MOD_Players:exists(self.user and self.user.serverId or 0)) then
        return
    end
    if (account ~= NCSEnum.AccountsType.CASH_MONEY and account ~= NCSEnum.AccountsType.CASH_MONEY) then
        NCS:die(("The account ^3%s^7 does not exist !"):format(account or "INVALID"))
        return
    end

    return (self.inventory.accounts[tonumber(account)] ~= nil)
end