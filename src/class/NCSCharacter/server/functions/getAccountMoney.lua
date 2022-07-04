----getAccountMoney
---@param account number
---@param count number
---@public
---@return void
function NCSCharacter:getAccountMoney(account, count)
    if (not MOD_Players:exists(self.user and self.user.serverId or 0)) then
        return (0)
    end
    if ((account ~= NCSEnum.AccountsType.CASH_MONEY and account ~= NCSEnum.AccountsType.CASH_MONEY) and not self.inventory.accounts[account]) then
        NCS:die(("The account ^3%s^7 does not exist for the player ^3%s^7 !"):format(account or "INVALID", self.id))
        return (0)
    end
    return (self.inventory.accounts[tonumber(account)].money)
end