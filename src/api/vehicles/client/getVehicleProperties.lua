-- TODO : This function is very weird, it should be refactored to make it more readable.:sh

---getProperties
---@param vehicleId number
---@return table
---@public
function API_Vehicles:getProperties(vehicleId)
    if (not DoesEntityExist(vehicleId)) then
        return (_NCS:die("Can't get vehicle properties for the vehicle (entity doesn't exist)"))
    end

    local primaryColor, secondaryColor = GetVehicleColours(vehicleId)
    local pearlescentColor, wheelColor = GetVehicleExtraColours(vehicleId)
    local modLivery
    local extras, neons = {}, {}
    local numberWindows, doors, neonCount = 0, 0, 0
    local vehicleDamage = {
        windows = {},
        doors = {},
        tyres = {},
    }

    if GetIsVehiclePrimaryColourCustom(vehicleId) then primaryColor = {GetVehicleCustomPrimaryColour(vehicleId)} end

    if GetIsVehicleSecondaryColourCustom(vehicleId) then secondaryColor = {GetVehicleCustomSecondaryColour(vehicleId)} end

    for extraId = 1, 15 do
        if DoesExtraExist(vehicleId, extraId) then
            local state = IsVehicleExtraTurnedOn(vehicleId, extraId) == 1
            extras[tostring(extraId)] = state
        end
    end

    if GetVehicleMod(vehicleId, 48) == -1 and GetVehicleLivery(vehicleId) ~= -1 then
        modLivery = GetVehicleLivery(vehicleId)
    else
        modLivery = GetVehicleMod(vehicleId, 48)
    end

    for i = 0, 7 do
        if not IsVehicleWindowIntact(vehicleId, i) then
            numberWindows = numberWindows + 1
            vehicleDamage.windows[numberWindows] = i
        end
    end

    for i = 0, 5 do
        if IsVehicleDoorDamaged(vehicleId, i) then
            doors = doors + 1
            vehicleDamage.doors[doors] = i
        end
    end

    for i = 0, 5 do
        if IsVehicleTyreBurst(vehicleId, i, false) then
            vehicleDamage.tyres[i] = IsVehicleTyreBurst(vehicleId, i, true) and 2 or 1
        end
    end

    for i = 0, 3 do
        if IsVehicleNeonLightEnabled(vehicleId, i) then
            neonCount = neonCount + 1
            neons[neonCount] = i
        end
    end

    return {
        model = GetEntityModel(vehicleId),
        plate = GetVehicleNumberPlateText(vehicleId),
        plateIndex = GetVehicleNumberPlateTextIndex(vehicleId),
        bodyHealth = math.floor(GetVehicleBodyHealth(vehicleId) + 0.5),
        engineHealth = math.floor(GetVehicleEngineHealth(vehicleId) + 0.5),
        tankHealth = math.floor(GetVehiclePetrolTankHealth(vehicleId) + 0.5),
        fuelLevel = math.floor(GetVehicleFuelLevel(vehicleId) + 0.5),
        dirtLevel = math.floor(GetVehicleDirtLevel(vehicleId) + 0.5),
        color1 = primaryColor,
        color2 = secondaryColor,
        pearlescentColor = pearlescentColor,
        interiorColor = GetVehicleInteriorColor(vehicleId),
        dashboardColor = GetVehicleDashboardColour(vehicleId),
        wheelColor = wheelColor,
        wheels = GetVehicleWheelType(vehicleId),
        windowTint = GetVehicleWindowTint(vehicleId),
        xenonColor = GetVehicleXenonLightsColour(vehicleId),
        neonEnabled = neons,
        neonColor = table.pack(GetVehicleNeonLightsColour(vehicleId)),
        extras = extras,
        tyreSmokeColor = table.pack(GetVehicleTyreSmokeColor(vehicleId)),
        modSpoilers = GetVehicleMod(vehicleId, 0),
        modFrontBumper = GetVehicleMod(vehicleId, 1),
        modRearBumper = GetVehicleMod(vehicleId, 2),
        modSideSkirt = GetVehicleMod(vehicleId, 3),
        modExhaust = GetVehicleMod(vehicleId, 4),
        modFrame = GetVehicleMod(vehicleId, 5),
        modGrille = GetVehicleMod(vehicleId, 6),
        modHood = GetVehicleMod(vehicleId, 7),
        modFender = GetVehicleMod(vehicleId, 8),
        modRightFender = GetVehicleMod(vehicleId, 9),
        modRoof = GetVehicleMod(vehicleId, 10),
        modEngine = GetVehicleMod(vehicleId, 11),
        modBrakes = GetVehicleMod(vehicleId, 12),
        modTransmission = GetVehicleMod(vehicleId, 13),
        modHorns = GetVehicleMod(vehicleId, 14),
        modSuspension = GetVehicleMod(vehicleId, 15),
        modArmor = GetVehicleMod(vehicleId, 16),
        modNitrous = GetVehicleMod(vehicleId, 17),
        modTurbo = IsToggleModOn(vehicleId, 18),
        modSubwoofer = GetVehicleMod(vehicleId, 19),
        modSmokeEnabled = IsToggleModOn(vehicleId, 20),
        modHydraulics = IsToggleModOn(vehicleId, 21),
        modXenon = IsToggleModOn(vehicleId, 22),
        modFrontWheels = GetVehicleMod(vehicleId, 23),
        modBackWheels = GetVehicleMod(vehicleId, 24),
        modCustomTiresF = GetVehicleModVariation(vehicleId, 23),
        modCustomTiresR = GetVehicleModVariation(vehicleId, 24),
        modPlateHolder = GetVehicleMod(vehicleId, 25),
        modVanityPlate = GetVehicleMod(vehicleId, 26),
        modTrimA = GetVehicleMod(vehicleId, 27),
        modOrnaments = GetVehicleMod(vehicleId, 28),
        modDashboard = GetVehicleMod(vehicleId, 29),
        modDial = GetVehicleMod(vehicleId, 30),
        modDoorSpeaker = GetVehicleMod(vehicleId, 31),
        modSeats = GetVehicleMod(vehicleId, 32),
        modSteeringWheel = GetVehicleMod(vehicleId, 33),
        modShifterLeavers = GetVehicleMod(vehicleId, 34),
        modAPlate = GetVehicleMod(vehicleId, 35),
        modSpeakers = GetVehicleMod(vehicleId, 36),
        modTrunk = GetVehicleMod(vehicleId, 37),
        modHydrolic = GetVehicleMod(vehicleId, 38),
        modEngineBlock = GetVehicleMod(vehicleId, 39),
        modAirFilter = GetVehicleMod(vehicleId, 40),
        modStruts = GetVehicleMod(vehicleId, 41),
        modArchCover = GetVehicleMod(vehicleId, 42),
        modAerials = GetVehicleMod(vehicleId, 43),
        modTrimB = GetVehicleMod(vehicleId, 44),
        modTank = GetVehicleMod(vehicleId, 45),
        modWindows = GetVehicleMod(vehicleId, 46),
        modDoorR = GetVehicleMod(vehicleId, 47),
        modLivery = modLivery,
        modLightbar = GetVehicleMod(vehicleId, 49),
        windows = vehicleDamage.windows,
        doors = vehicleDamage.doors,
        tyres = vehicleDamage.tyres,
        leftHeadlight = vehicleDamage.leftHeadlight,
        rightHeadlight = vehicleDamage.rightHeadlight,
        frontBumper = vehicleDamage.frontBumper,
        rearBumper = vehicleDamage.rearBumper,
    }
end
