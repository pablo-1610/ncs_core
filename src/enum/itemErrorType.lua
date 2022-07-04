NCSEnum.ItemErrorType = {
    SUCCESS = 1,
    ITEM_NOT_EXIST = 2,
    PLAYER_NOT_EXIST = 3,
    NOT_SUFFICIENT_PLACE = 4,
    NOT_PLAYER_HAS_ITEM = 5
}

function NCSEnum._getItemErrorType(code)
    for k, v in pairs(NCSEnum.ItemErrorType) do
        if (v == code) then
            return (tostring(k))
        end
    end
    return ('Unknown')
end