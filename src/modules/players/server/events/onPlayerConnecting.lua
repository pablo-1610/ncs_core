local function isValidIdentification(identifierType)
    for _, validIdentifierType in pairs(_NCSConstant.validIdentifiers) do
        if (identifierType == validIdentifierType) then
            return (true)
        end
    end
    return (false)
end

AddEventHandler("playerConnecting", function(playerName, _, connection)
    connection.defer()

    local _src <const> = source
    local identifier <const> = API_Player:getIdentifier(_src)
    local canConnect <const> = isValidIdentification(MOD_Config:getIdentificationType())

    -- Check if identification method is valid
    if (not (canConnect)) then
        connection.done(_Literals.ERROR_SERVER_IDENTIFICATION_METHOD_BROKEN)
        return
    end

    MOD_Players:retrieveCharacters(identifier, function(result)
        -- TODO : Retrieve characters from database and then, show a deferal card (adaptivecard) to select one.
    end)
end)