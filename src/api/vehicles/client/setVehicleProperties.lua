---setProperties
---@param vehicleId number
---@param props table
---@return void
---@public
function API_Vehicles:setProperties(vehicleId, props)
    if not DoesEntityExist(vehicleId) then
        return NCS:die("Can't set vehicle properties for the vehicle (entity doesn't exist)")
    end
    if NetworkGetEntityOwner(vehicleId) ~= PlayerId() then
        return NCS:die("Can't set vehicle properties for the vehicle (client is not the entity owner")
    end

    local primaryColor, secondaryColor = GetVehicleColours(vehicleId)
    local pearlescentColor, wheelColor = GetVehicleExtraColours(vehicleId)
    SetVehicleModKit(vehicleId, 0)
    SetVehicleAutoRepairDisabled(vehicleId, true)

    if (props.plate) then
        SetVehicleNumberPlateText(vehicleId, props.plate)
    end
    if (props.plateIndex) then
        SetVehicleNumberPlateTextIndex(vehicleId, props.plateIndex)
    end
    if (props.bodyHealth) then
        SetVehicleBodyHealth(vehicleId, props.bodyHealth + 0.0)
    end
    if (props.engineHealth) then
        SetVehicleEngineHealth(vehicleId, props.engineHealth + 0.0)
    end
    if (props.tankHealth) then
        SetVehiclePetrolTankHealth(vehicleId, props.tankHealth + 0.0)
    end
    if (props.fuelLevel) then
        SetVehicleFuelLevel(vehicleId, props.fuelLevel + 0.0)
    end
    if (props.dirtLevel) then
        SetVehicleDirtLevel(vehicleId, props.dirtLevel + 0.0)
    end
    if (props.color1) then
        if type(props.color1) == "number" then
            SetVehicleColours(vehicleId, props.color1, secondaryColor)
        else
            SetVehicleCustomPrimaryColour(vehicleId, props.color1[1], props.color1[2], props.color1[3])
        end
    end
    if (props.color2) then
        if type(props.color2) == "number" then
            SetVehicleColours(vehicleId, props.color1 or primaryColor, props.color2)
        else
            SetVehicleCustomSecondaryColour(vehicleId, props.color2[1], props.color2[2], props.color2[3])
        end
    end
    if (props.pearlescentColor) then
        SetVehicleExtraColours(vehicleId, props.pearlescentColor, wheelColor)
    end
    if (props.interiorColor) then
        SetVehicleInteriorColor(vehicleId, props.interiorColor)
    end
    if (props.dashboardColor) then
        SetVehicleDashboardColour(vehicleId, props.dashboardColor)
    end
    if (props.wheelColor) then
        SetVehicleExtraColours(vehicleId, props.pearlescentColor or pearlescentColor, props.wheelColor)
    end
    if (props.wheels) then
        SetVehicleWheelType(vehicleId, props.wheels)
    end
    if (props.windowTint) then
        SetVehicleWindowTint(vehicleId, props.windowTint)
    end
    if (props.neonEnabled) then
        for i = 1, #props.neonEnabled do
            SetVehicleNeonLightEnabled(vehicleId, props.neonEnabled[i], true)
        end
    end
    if (props.extras) then
        for id, state in pairs(props.extras) do
            SetVehicleExtra(vehicleId, id, state)
        end
    end
    if (props.windows) then
        for i = 1, #props.windows do
            SmashVehicleWindow(vehicleId, props.windows[i])
        end
    end
    if (props.doors) then
        for i = 1, #props.doors do
            SetVehicleDoorBroken(vehicleId, props.windows[i], false)
        end
    end
    if (props.tyres) then
        for tyre, state in pairs(props.tyres) do
            if state == 1 then
                SetVehicleTyreBurst(vehicleId, tyre, false, 1000.0)
            else
                SetVehicleTyreBurst(vehicleId, tyre, true)
            end
        end
    end
    if (props.neonColor) then
        SetVehicleNeonLightsColour(vehicleId, props.neonColor[1], props.neonColor[2], props.neonColor[3])
    end
    if (props.xenonColor) then
        SetVehicleXenonLightsColour(vehicleId, props.xenonColor)
    end
    if (props.modSmokeEnabled) then
        ToggleVehicleMod(vehicleId, 20, true)
    end
    if (props.tyreSmokeColor) then
        SetVehicleTyreSmokeColor(vehicleId, props.tyreSmokeColor[1], props.tyreSmokeColor[2], props.tyreSmokeColor[3])
    end
    if (props.modSpoilers) then
        SetVehicleMod(vehicleId, 0, props.modSpoilers, false)
    end
    if (props.modFrontBumper) then
        SetVehicleMod(vehicleId, 1, props.modFrontBumper, false)
    end
    if (props.modRearBumper) then
        SetVehicleMod(vehicleId, 2, props.modRearBumper, false)
    end
    if (props.modSideSkirt) then
        SetVehicleMod(vehicleId, 3, props.modSideSkirt, false)
    end
    if (props.modExhaust) then
        SetVehicleMod(vehicleId, 4, props.modExhaust, false)
    end
    if (props.modFrame) then
        SetVehicleMod(vehicleId, 5, props.modFrame, false)
    end
    if (props.modGrille) then
        SetVehicleMod(vehicleId, 6, props.modGrille, false)
    end
    if (props.modHood) then
        SetVehicleMod(vehicleId, 7, props.modHood, false)
    end
    if (props.modFender) then
        SetVehicleMod(vehicleId, 8, props.modFender, false)
    end
    if (props.modRightFender) then
        SetVehicleMod(vehicleId, 9, props.modRightFender, false)
    end
    if (props.modRoof) then
        SetVehicleMod(vehicleId, 10, props.modRoof, false)
    end
    if (props.modEngine) then
        SetVehicleMod(vehicleId, 11, props.modEngine, false)
    end
    if (props.modBrakes) then
        SetVehicleMod(vehicleId, 12, props.modBrakes, false)
    end
    if (props.modTransmission) then
        SetVehicleMod(vehicleId, 13, props.modTransmission, false)
    end
    if (props.modHorns) then
        SetVehicleMod(vehicleId, 14, props.modHorns, false)
    end
    if (props.modSuspension) then
        SetVehicleMod(vehicleId, 15, props.modSuspension, false)
    end
    if (props.modArmor) then
        SetVehicleMod(vehicleId, 16, props.modArmor, false)
    end
    if (props.modTurbo) then
        ToggleVehicleMod(vehicleId, 18, props.modTurbo)
    end
    if (props.modSubwoofer) then
        ToggleVehicleMod(vehicleId, 19, props.modSubwoofer)
    end
    if (props.modHydraulics) then
        ToggleVehicleMod(vehicleId, 21, props.modHydraulics)
    end
    if (props.modXenon) then
        ToggleVehicleMod(vehicleId, 22, props.modXenon)
    end
    if (props.modFrontWheels) then
        SetVehicleMod(vehicleId, 23, props.modFrontWheels, false)
    end
    if (props.modBackWheels) then
        SetVehicleMod(vehicleId, 24, props.modBackWheels, false)
    end
    if (props.modPlateHolder) then
        SetVehicleMod(vehicleId, 25, props.modPlateHolder, false)
    end
    if (props.modVanityPlate) then
        SetVehicleMod(vehicleId, 26, props.modVanityPlate, false)
    end
    if (props.modTrimA) then
        SetVehicleMod(vehicleId, 27, props.modTrimA, false)
    end
    if (props.modOrnaments) then
        SetVehicleMod(vehicleId, 28, props.modOrnaments, false)
    end
    if (props.modDashboard) then
        SetVehicleMod(vehicleId, 29, props.modDashboard, false)
    end
    if (props.modDial) then
        SetVehicleMod(vehicleId, 30, props.modDial, false)
    end
    if (props.modDoorSpeaker) then
        SetVehicleMod(vehicleId, 31, props.modDoorSpeaker, false)
    end
    if (props.modSeats) then
        SetVehicleMod(vehicleId, 32, props.modSeats, false)
    end
    if (props.modSteeringWheel) then
        SetVehicleMod(vehicleId, 33, props.modSteeringWheel, false)
    end
    if (props.modShifterLeavers) then
        SetVehicleMod(vehicleId, 34, props.modShifterLeavers, false)
    end
    if (props.modAPlate) then
        SetVehicleMod(vehicleId, 35, props.modAPlate, false)
    end
    if (props.modSpeakers) then
        SetVehicleMod(vehicleId, 36, props.modSpeakers, false)
    end
    if (props.modTrunk) then
        SetVehicleMod(vehicleId, 37, props.modTrunk, false)
    end
    if (props.modHydrolic) then
        SetVehicleMod(vehicleId, 38, props.modHydrolic, false)
    end
    if (props.modEngineBlock) then
        SetVehicleMod(vehicleId, 39, props.modEngineBlock, false)
    end
    if (props.modAirFilter) then
        SetVehicleMod(vehicleId, 40, props.modAirFilter, false)
    end
    if (props.modStruts) then
        SetVehicleMod(vehicleId, 41, props.modStruts, false)
    end
    if (props.modArchCover) then
        SetVehicleMod(vehicleId, 42, props.modArchCover, false)
    end
    if (props.modAerials) then
        SetVehicleMod(vehicleId, 43, props.modAerials, false)
    end
    if (props.modTrimB) then
        SetVehicleMod(vehicleId, 44, props.modTrimB, false)
    end
    if (props.modTank) then
        SetVehicleMod(vehicleId, 45, props.modTank, false)
    end
    if (props.modWindows) then
        SetVehicleMod(vehicleId, 46, props.modWindows, false)
    end
    if (props.modDoorR) then
        SetVehicleMod(vehicleId, 47, props.modDoorR, false)
    end
    if (props.modLightbar) then
        SetVehicleMod(vehicleId, 49, props.modLightbar, false)
    end
    if (props.modLivery) then
        SetVehicleMod(vehicleId, 48, props.modLivery, false)
        SetVehicleLivery(vehicleId, props.modLivery)
    end
end
