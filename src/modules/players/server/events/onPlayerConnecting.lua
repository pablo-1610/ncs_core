local function isValidIdentification(identifierType)
    for _, validIdentifierType in pairs(NCSConstant.validIdentifiers) do
        if (identifierType == validIdentifierType) then
            return (true)
        end
    end
    return (false)
end

AddEventHandler("playerConnecting", function(playerName, _, connection)
    connection.defer()

    if (not (NCS.ready)) then
        connection.done(("💢 %s"):format(_Literals.ERROR_SERVER_STARTING_UP))
        return
    end

    local identifier <const> = API_Player:getIdentifier(source)

    if (MOD_Sanctions:isPlayerBan(identifier)) then
        local banP <const> = MOD_Sanctions.List.Bans[identifier]
        local currentTime <const> = os.time()
        if (os.time() > banP.time) then
            connection.update(("💢 %s"):format(_Literals.UNBAN_DEFAULT_MESSAGE))
            MOD_Sanctions:unbanPlayer(identifier, banP.ban_id)
            Wait(1500)
            connection.done()
        else
            local timeDate <const> = API_Maths:getDateByUnixTime(banP["time"])
            local unbanDate <const> = ("%s/%s/%s [%sh%s]"):format(timeDate.day, timeDate.month, timeDate.year, timeDate.hour, timeDate.min)
            connection.done(("💢 %s\n\nID: %s\nReason: %s\nUnban Date: %s"):format(_Literals.BAN_DEFAULT_MESSAGE, banP["ban_id"], banP["reason"], unbanDate))
            return
        end
    end

    if (MOD_Players:isInConnectingList(identifier)) then
        connection.done(("😖 %s"):format(_Literals.ERROR_ALREADY_CONNECTED))
        return
    end

    local canConnect <const> = isValidIdentification(MOD_Config:getIdentificationType())

    if (not (canConnect)) then
        connection.done(_Literals.ERROR_SERVER_IDENTIFICATION_METHOD_BROKEN)
        return
    end

    local function connect(characterIdentifier)
        MOD_Players.selectedCharacter[identifier] = characterIdentifier
        MOD_Players:setLastCharacterId(identifier, characterIdentifier)
        connection.done()
    end

    local function showCharacterCreator(onDone)
        local creatorAdaptiveCard <const> = NCSAdaptiveCardBuilder()
                :addTitle(_Literals.CONNECTION_CHARACTER_CREATION_TITLE)
                :addInput("sex", NCSEnum.AdaptiveCardInput.TEXT, true, _Literals.CONNECTION_CHARACTER_CREATION_SEX)
                :addInput("firstname", NCSEnum.AdaptiveCardInput.TEXT, true, _Literals.CONNECTION_CHARACTER_CREATION_FIRSTNAME)
                :addInput("lastname", NCSEnum.AdaptiveCardInput.TEXT, true, _Literals.CONNECTION_CHARACTER_CREATION_LASTNAME)
                :addInput("dob", NCSEnum.AdaptiveCardInput.DATE, true, _Literals.CONNECTION_CHARACTER_CREATION_DOB)
                :addInput("height", NCSEnum.AdaptiveCardInput.NUMBER, true, _Literals.CONNECTION_CHARACTER_CREATION_HEIGHT)
                :addActionSet("actions", { NCSAdaptiveCardAction(NCSEnum.AdaptiveCardAction.SUBMIT, _Literals.CONNECTION_CHARACTER_CREATION_BUTTON_CREATE, "create") })
        connection.presentCard(creatorAdaptiveCard:build(), function(data)
            local action <const> = data.submitId
            data.submitId = nil
            if (action == "create") then
                connection.update(("🧸 %s"):format(_Literals.CONNECTING_CREATING_CHARACTER))
                MOD_Players:registerCharacter(identifier, data, function(characterId)
                    if (not (characterId)) then
                        connection.done(_Literals.ERROR_SERVER_CHARACTER_CREATION_FAILED)
                        return
                    end
                    onDone(characterId)
                    return
                end)
            else
                onDone()
            end
        end)
    end

    MOD_Players:existsInDatabase(identifier, function(exists)
        if (not (exists)) then
            NCS:trace(("Registering new player: ^3%s"):format(playerName))
            MOD_Players:register(identifier)
        end
    end)

    MOD_Players:retrieveCharacters(identifier, function(rows)
        if (#rows == 0) then
            -- The player has no characters, we need to create one
            -- TODO : Change the adaptive card below (which is from an enum) to the new system with the NCSAdaptiveCardBuilder object
            local adaptiveCard = (NCSEnum.AdaptiveCard.CONNECTION_NO_CHARACTERS):format((_Literals.CONNECTION_WELCOME_MESSAGE):format(NCSInternal.ServerName), (_Literals.CONNECTION_CHARACTER_REQUIRED):format(NCSInternal.ServerName), _Literals.CONNECTION_BUTTON_CREATE)
            connection.presentCard(adaptiveCard, function()
                showCharacterCreator(function(characterId)
                    if (not (characterId)) then
                        connection.done(_Literals.ERROR_SERVER_CHARACTER_CREATION_FAILED)
                        return
                    end
                    connect(characterId)
                end)
            end)
            return
        end

        --[[
            No multiple characters allowed
        --]]

        if (GetConvarInt("ncs_allow_multiple_characters", 0) == 0) then
            -- Server is one character only, so we select the first one
            connect(rows[1].character_id)
            return
        end

        --[[
            Show characters
        --]]

        local function showMyCharacters(characters)
            local characterButtons <const> = {}
            for _, character in pairs(characters) do
                local characterIdentity <const> = json.decode(character.identity)
                table.insert(characterButtons, NCSAdaptiveCardAction(NCSEnum.AdaptiveCardAction.SUBMIT, (_Literals.CONNECTION_CHARACTER_SELECTION_BUTTON):format(("%s %s"):format(characterIdentity.firstname, characterIdentity.lastname)), tostring(character.character_id)))
            end
            local adaptiveCard <const> = NCSAdaptiveCardBuilder():addTitle(_Literals.CONNECTION_CHARACTER_SELECTION_TITLE):addActionSet("selection", characterButtons)
            connection.presentCard(adaptiveCard:build(), function(data)
                local characterId <const> = data.submitId
                if (characterId) then
                    connect(characterId)
                end
            end)
        end

        local function showMainMenu(characters)
            local actions <const> = { NCSAdaptiveCardAction(NCSEnum.AdaptiveCardAction.SUBMIT, _Literals.CONNECTION_CHARACTER_SELECT_FETCH_BUTTON, "fetch") }

            if (#characters < GetConvarInt("ncs_max_characters", 2)) then
                table.insert(actions, NCSAdaptiveCardAction(NCSEnum.AdaptiveCardAction.SUBMIT, _Literals.CONNECTION_CHARACTER_SELECT_CREATE_BUTTON, "create"))
            end

            local adaptiveCard <const> = NCSAdaptiveCardBuilder()
                    :addTitle((_Literals.CONNECTION_WELCOME_MESSAGE):format(NCSInternal.ServerName))
                    :addTextBloc(_Literals.CONNECTION_CHARACTER_SELECT_DESC)
                    :addActionSet("actions", actions)
            connection.presentCard(adaptiveCard:build(), function(data)
                local action <const> = data.submitId
                if (action == "create") then
                    showCharacterCreator(function()
                        MOD_Players:retrieveCharacters(identifier, function(newCharacters)
                            showMainMenu(newCharacters)
                        end)
                    end)
                elseif (action == "fetch") then
                    showMyCharacters(characters)
                end
            end)
        end
        showMainMenu(rows)
    end)
end)