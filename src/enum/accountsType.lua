NCSEnum.AccountsType = {
    CASH_MONEY = 1,
    BLACK_MONEY = 2
}

NCSEnum._getAccountLabel = function(accountType)
    local displayAccount<const> = { [1] = _Literals.CASH_MONEY, [2] = _Literals.BLACK_MONEY }
    return displayAccount[accountType]
end
