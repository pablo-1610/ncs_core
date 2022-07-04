----removeAccount
---@param account number
---@param count number
---@param callback function
---@public
---@return void
function NCSCharacter:removeAccount(account, count, callback)
    if (not MOD_Players:exists(self.user and self.user.serverId or 0)) then
        callback(NCSEnum.AccountErrorType.PLAYER_NOT_EXIST)
        return
    end
    if ((account ~= NCSEnum.AccountsType.CASH_MONEY and account ~= NCSEnum.AccountsType.CASH_MONEY) and not self.inventory.accounts[account]) then
        callback(NCSEnum.AccountErrorType.ACCOUNT_NOT_EXIST)
        return (NCS:die(("The account ^3%s^7 does not exist for the player ^3%s^7 !"):format(account or "INVALID", self.id)))
    end

    self.inventory.accounts[tonumber(account)].money = self.inventory.accounts[tonumber(account)].money - tonumber(count)
    callback(NCSEnum.AccountErrorType.SUCCESS)
end