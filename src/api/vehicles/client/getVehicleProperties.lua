---getProperties
---@param vehicleEntity number
---@return table
---@public
function API_Vehicles:getProperties(vehicleEntity)
    if DoesEntityExist(vehicleEntity) then
        local colorPrimary, colorSecondary = GetVehicleColours(vehicleEntity)
        local pearlescentColor, wheelColor = GetVehicleExtraColours(vehicleEntity)
        local extras = {}

        for extraId = 1, 15 do
            if DoesExtraExist(vehicleEntity, extraId) then
                local state = IsVehicleExtraTurnedOn(vehicleEntity, extraId) == 1
                extras[tostring(extraId)] = state
            end
        end

        return {
            model = GetEntityModel(vehicleEntity),

            plate = GetVehicleNumberPlateText(vehicleEntity),
            plateIndex = GetVehicleNumberPlateTextIndex(vehicleEntity),
            color1 = colorPrimary,
            color2 = colorSecondary,

            pearlescentColor = pearlescentColor,
            wheelColor = wheelColor,

            wheels = GetVehicleWheelType(vehicleEntity),
            windowTint = GetVehicleWindowTint(vehicleEntity),
            xenonColor = GetVehicleXenonLightsColour(vehicleEntity),

            neonEnabled = {
                IsVehicleNeonLightEnabled(vehicleEntity, 0),
                IsVehicleNeonLightEnabled(vehicleEntity, 1),
                IsVehicleNeonLightEnabled(vehicleEntity, 2),
                IsVehicleNeonLightEnabled(vehicleEntity, 3)
            },

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

            modTurbo = IsToggleModOn(vehicleEntity, 18),
            modSmokeEnabled = IsToggleModOn(vehicleEntity, 20),
            modXenon = IsToggleModOn(vehicleEntity, 22),

            modFrontWheels = GetVehicleMod(vehicleEntity, 23),
            modBackWheels = GetVehicleMod(vehicleEntity, 24),

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
            modLivery = GetVehicleMod(vehicleEntity, 48),
        }
    else
        return
    end
end