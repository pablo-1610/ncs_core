NCSEnum.AccountErrorType = {
    SUCCESS = 1,
    ACCOUNT_NOT_EXIST = 2,
    PLAYER_NOT_EXIST = 3,
    NOT_SUFFICIENT_MONEY = 4,
}

function NCSEnum._getAccountErrorType(code)
    for k, v in pairs(NCSEnum.AccountErrorType) do
        if (v == code) then
            return (tostring(k))
        end
    end
    return ('Unknown')
end