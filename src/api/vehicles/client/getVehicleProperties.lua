---getProperties
---@param vehicleEntity number
---@return table
---@public
function API_Vehicles:getProperties(vehicleEntity)
    if not DoesEntityExist(vehicleEntity) then
        return _NCS:die("Can't get vehicle properties for the vehicle (entity doesn't exist)")
    end

    local colorPrimary, colorSecondary = GetVehicleColours(vehicleEntity)
    local pearlescentColor, wheelColor = GetVehicleExtraColours(vehicleEntity)
    local modLivery
    local extras, neons = {}, {}
    local numberWindows, doors, neonCount = 0, 0, 0
    local vehicleDamage = {
        windows = {},
        doors = {},
        tyres = {},
    }

    if GetIsVehiclePrimaryColourCustom(vehicleEntity) then colorPrimary = {GetVehicleCustomPrimaryColour(vehicleEntity)} end

    if GetIsVehicleSecondaryColourCustom(vehicleEntity) then colorSecondary = {GetVehicleCustomSecondaryColour(vehicleEntity)} end
    
    for extraId = 1, 15 do
        if DoesExtraExist(vehicleEntity, extraId) then
            local state = IsVehicleExtraTurnedOn(vehicleEntity, extraId) == 1
            extras[tostring(extraId)] = state
        end
    end

    if GetVehicleMod(vehicleEntity, 48) == -1 and GetVehicleLivery(vehicleEntity) ~= -1 then 
        modLivery = GetVehicleLivery(vehicleEntity)
    else
        modLivery = GetVehicleMod(vehicleEntity, 48)
    end

    for i = 0, 7 do
        if not IsVehicleWindowIntact(vehicleEntity, i) then
            numberWindows = numberWindows + 1
            vehicleDamage.windows[numberWindows] = i
        end
    end

    for i = 0, 5 do
        if IsVehicleDoorDamaged(vehicleEntity, i) then
            doors = doors + 1
            vehicleDamage.doors[doors] = i
        end
    end

    for i = 0, 5 do
        if IsVehicleTyreBurst(vehicleEntity, i, false) then
            vehicleDamage.tyres[i] = IsVehicleTyreBurst(vehicleEntity, i, true) and 2 or 1
        end
    end

    for i = 0, 3 do
        if IsVehicleNeonLightEnabled(vehicleEntity, i) then
            neonCount = neonCount + 1
            neons[neonCount] = i
        end
    end

    return {
        model = GetEntityModel(vehicleEntity),
        plate = GetVehicleNumberPlateText(vehicleEntity),
        plateIndex = GetVehicleNumberPlateTextIndex(vehicleEntity),
        bodyHealth = math.floor(GetVehicleBodyHealth(vehicleEntity) + 0.5),
        engineHealth = math.floor(GetVehicleEngineHealth(vehicleEntity) + 0.5),
        tankHealth = math.floor(GetVehiclePetrolTankHealth(vehicleEntity) + 0.5),
        fuelLevel = math.floor(GetVehicleFuelLevel(vehicleEntity) + 0.5),
        dirtLevel = math.floor(GetVehicleDirtLevel(vehicleEntity) + 0.5),
        color1 = colorPrimary,
        color2 = colorSecondary,
        pearlescentColor = pearlescentColor,
        interiorColor = GetVehicleInteriorColor(vehicleEntity),
        dashboardColor = GetVehicleDashboardColour(vehicleEntity),
        wheelColor = wheelColor,
        wheels = GetVehicleWheelType(vehicleEntity),
        windowTint = GetVehicleWindowTint(vehicleEntity),
        xenonColor = GetVehicleXenonLightsColour(vehicleEntity),
        neonEnabled = neons,
        neonColor = table.pack(GetVehicleNeonLightsColour(vehicleEntity)),
        extras = extras,
        tyreSmokeColor = table.pack(GetVehicleTyreSmokeColor(vehicleEntity)),
        modSpoilers = GetVehicleMod(vehicleEntity, 0),
        modFrontBumper = GetVehicleMod(vehicleEntity, 1),
        modRearBumper = GetVehicleMod(vehicleEntity, 2),
        modSideSkirt = GetVehicleMod(vehicleEntity, 3),
        modExhaust = GetVehicleMod(vehicleEntity, 4),
        modFrame = GetVehicleMod(vehicleEntity, 5),
        modGrille = GetVehicleMod(vehicleEntity, 6),
        modHood = GetVehicleMod(vehicleEntity, 7),
        modFender = GetVehicleMod(vehicleEntity, 8),
        modRightFender = GetVehicleMod(vehicleEntity, 9),
        modRoof = GetVehicleMod(vehicleEntity, 10),
        modEngine = GetVehicleMod(vehicleEntity, 11),
        modBrakes = GetVehicleMod(vehicleEntity, 12),
        modTransmission = GetVehicleMod(vehicleEntity, 13),
        modHorns = GetVehicleMod(vehicleEntity, 14),
        modSuspension = GetVehicleMod(vehicleEntity, 15),
        modArmor = GetVehicleMod(vehicleEntity, 16),
        modNitrous = GetVehicleMod(vehicleEntity, 17),
        modTurbo = IsToggleModOn(vehicleEntity, 18),
        modSubwoofer = GetVehicleMod(vehicleEntity, 19),
        modSmokeEnabled = IsToggleModOn(vehicleEntity, 20),
        modHydraulics = IsToggleModOn(vehicleEntity, 21),
        modXenon = IsToggleModOn(vehicleEntity, 22),
        modFrontWheels = GetVehicleMod(vehicleEntity, 23),
        modBackWheels = GetVehicleMod(vehicleEntity, 24),
        modCustomTiresF = GetVehicleModVariation(vehicleEntity, 23),
        modCustomTiresR = GetVehicleModVariation(vehicleEntity, 24),
        modPlateHolder = GetVehicleMod(vehicleEntity, 25),
        modVanityPlate = GetVehicleMod(vehicleEntity, 26),
        modTrimA = GetVehicleMod(vehicleEntity, 27),
        modOrnaments = GetVehicleMod(vehicleEntity, 28),
        modDashboard = GetVehicleMod(vehicleEntity, 29),
        modDial = GetVehicleMod(vehicleEntity, 30),
        modDoorSpeaker = GetVehicleMod(vehicleEntity, 31),
        modSeats = GetVehicleMod(vehicleEntity, 32),
        modSteeringWheel = GetVehicleMod(vehicleEntity, 33),
        modShifterLeavers = GetVehicleMod(vehicleEntity, 34),
        modAPlate = GetVehicleMod(vehicleEntity, 35),
        modSpeakers = GetVehicleMod(vehicleEntity, 36),
        modTrunk = GetVehicleMod(vehicleEntity, 37),
        modHydrolic = GetVehicleMod(vehicleEntity, 38),
        modEngineBlock = GetVehicleMod(vehicleEntity, 39),
        modAirFilter = GetVehicleMod(vehicleEntity, 40),
        modStruts = GetVehicleMod(vehicleEntity, 41),
        modArchCover = GetVehicleMod(vehicleEntity, 42),
        modAerials = GetVehicleMod(vehicleEntity, 43),
        modTrimB = GetVehicleMod(vehicleEntity, 44),
        modTank = GetVehicleMod(vehicleEntity, 45),
        modWindows = GetVehicleMod(vehicleEntity, 46),
        modDoorR = GetVehicleMod(vehicleEntity, 47),
        modLivery = modLivery,
        modLightbar = GetVehicleMod(vehicleEntity, 49),
        windows = vehicleDamage.windows,
        doors = vehicleDamage.doors,
        tyres = vehicleDamage.tyres,
        leftHeadlight = vehicleDamage.leftHeadlight,
        rightHeadlight = vehicleDamage.rightHeadlight,
        frontBumper = vehicleDamage.frontBumper,
        rearBumper = vehicleDamage.rearBumper,
    }

end