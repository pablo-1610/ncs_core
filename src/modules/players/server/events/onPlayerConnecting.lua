AddEventHandler("playerConnecting", function(playerName, _, connection)
    local _src <const> = source

    connection.defer()

    if (MOD_Players:exists(_src)) then
        connection.done(_Literals.ERROR_ALREADY_CONNECTED)
    end

    connection.done()
end)