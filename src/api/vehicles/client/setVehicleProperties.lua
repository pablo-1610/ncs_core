---setProperties
---@param vehicleEntity number
---@param props table
---@return void
---@public
function API_Vehicles:setProperties(vehicleEntity, props)
    if not DoesEntityExist(vehicleEntity) then
        return _NCS:die("Can't set vehicle properties for the vehicle (entity doesn't exist)")
    end
    if NetworkGetEntityOwner(vehicleEntity) ~= PlayerId() then
        return _NCS:die("Can't set vehicle properties for the vehicle (client is not the entity owner")
    end

    local colorPrimary, colorSecondary = GetVehicleColours(vehicleEntity)
    local pearlescentColor, wheelColor = GetVehicleExtraColours(vehicleEntity)
    SetVehicleModKit(vehicleEntity, 0)

    if props.plate then
        SetVehicleNumberPlateText(vehicleEntity, props.plate)
    end
    if props.plateIndex then
        SetVehicleNumberPlateTextIndex(vehicleEntity, props.plateIndex)
    end
    if props.bodyHealth then
        SetVehicleBodyHealth(vehicleEntity, props.bodyHealth + 0.0)
    end
    if props.engineHealth then
        SetVehicleEngineHealth(vehicleEntity, props.engineHealth + 0.0)
    end
    if props.tankHealth then
        SetVehiclePetrolTankHealth(vehicleEntity, props.tankHealth + 0.0)
    end
    if props.fuelLevel then
        SetVehicleFuelLevel(vehicleEntity, props.fuelLevel + 0.0)
    end
    if props.dirtLevel then
        SetVehicleDirtLevel(vehicleEntity, props.dirtLevel + 0.0)
    end
    if props.color1 then
        SetVehicleColours(vehicleEntity, props.color1, colorSecondary)
    end
    if props.color2 then
        SetVehicleColours(vehicleEntity, props.color1 or colorPrimary, props.color2)
    end
    if props.pearlescentColor then
        SetVehicleExtraColours(vehicleEntity, props.pearlescentColor, wheelColor)
    end
    if props.wheelColor then
        SetVehicleExtraColours(vehicleEntity, props.pearlescentColor or pearlescentColor, props.wheelColor)
    end
    if props.wheels then
        SetVehicleWheelType(vehicleEntity, props.wheels)
    end
    if props.windowTint then
        SetVehicleWindowTint(vehicleEntity, props.windowTint)
    end

    if props.neonEnabled then
        SetVehicleNeonLightEnabled(vehicleEntity, 0, props.neonEnabled[1])
        SetVehicleNeonLightEnabled(vehicleEntity, 1, props.neonEnabled[2])
        SetVehicleNeonLightEnabled(vehicleEntity, 2, props.neonEnabled[3])
        SetVehicleNeonLightEnabled(vehicleEntity, 3, props.neonEnabled[4])
    end

    if props.extras then
        for extraId, enabled in pairs(props.extras) do
            if enabled then
                SetVehicleExtra(vehicleEntity, tonumber(extraId), 0)
            else
                SetVehicleExtra(vehicleEntity, tonumber(extraId), 1)
            end
        end
    end

    if props.neonColor then
        SetVehicleNeonLightsColour(vehicleEntity, props.neonColor[1], props.neonColor[2], props.neonColor[3])
    end
    if props.xenonColor then
        SetVehicleXenonLightsColour(vehicleEntity, props.xenonColor)
    end
    if props.modSmokeEnabled then
        ToggleVehicleMod(vehicleEntity, 20, true)
    end
    if props.tyreSmokeColor then
        SetVehicleTyreSmokeColor(vehicleEntity, props.tyreSmokeColor[1], props.tyreSmokeColor[2], props.tyreSmokeColor[3])
    end
    if props.modSpoilers then
        SetVehicleMod(vehicleEntity, 0, props.modSpoilers, false)
    end
    if props.modFrontBumper then
        SetVehicleMod(vehicleEntity, 1, props.modFrontBumper, false)
    end
    if props.modRearBumper then
        SetVehicleMod(vehicleEntity, 2, props.modRearBumper, false)
    end
    if props.modSideSkirt then
        SetVehicleMod(vehicleEntity, 3, props.modSideSkirt, false)
    end
    if props.modExhaust then
        SetVehicleMod(vehicleEntity, 4, props.modExhaust, false)
    end
    if props.modFrame then
        SetVehicleMod(vehicleEntity, 5, props.modFrame, false)
    end
    if props.modGrille then
        SetVehicleMod(vehicleEntity, 6, props.modGrille, false)
    end
    if props.modHood then
        SetVehicleMod(vehicleEntity, 7, props.modHood, false)
    end
    if props.modFender then
        SetVehicleMod(vehicleEntity, 8, props.modFender, false)
    end
    if props.modRightFender then
        SetVehicleMod(vehicleEntity, 9, props.modRightFender, false)
    end
    if props.modRoof then
        SetVehicleMod(vehicleEntity, 10, props.modRoof, false)
    end
    if props.modEngine then
        SetVehicleMod(vehicleEntity, 11, props.modEngine, false)
    end
    if props.modBrakes then
        SetVehicleMod(vehicleEntity, 12, props.modBrakes, false)
    end
    if props.modTransmission then
        SetVehicleMod(vehicleEntity, 13, props.modTransmission, false)
    end
    if props.modHorns then
        SetVehicleMod(vehicleEntity, 14, props.modHorns, false)
    end
    if props.modSuspension then
        SetVehicleMod(vehicleEntity, 15, props.modSuspension, false)
    end
    if props.modArmor then
        SetVehicleMod(vehicleEntity, 16, props.modArmor, false)
    end
    if props.modTurbo then
        ToggleVehicleMod(vehicleEntity, 18, props.modTurbo)
    end
    if props.modXenon then
        ToggleVehicleMod(vehicleEntity, 22, props.modXenon)
    end
    if props.modFrontWheels then
        SetVehicleMod(vehicleEntity, 23, props.modFrontWheels, false)
    end
    if props.modBackWheels then
        SetVehicleMod(vehicleEntity, 24, props.modBackWheels, false)
    end
    if props.modPlateHolder then
        SetVehicleMod(vehicleEntity, 25, props.modPlateHolder, false)
    end
    if props.modVanityPlate then
        SetVehicleMod(vehicleEntity, 26, props.modVanityPlate, false)
    end
    if props.modTrimA then
        SetVehicleMod(vehicleEntity, 27, props.modTrimA, false)
    end
    if props.modOrnaments then
        SetVehicleMod(vehicleEntity, 28, props.modOrnaments, false)
    end
    if props.modDashboard then
        SetVehicleMod(vehicleEntity, 29, props.modDashboard, false)
    end
    if props.modDial then
        SetVehicleMod(vehicleEntity, 30, props.modDial, false)
    end
    if props.modDoorSpeaker then
        SetVehicleMod(vehicleEntity, 31, props.modDoorSpeaker, false)
    end
    if props.modSeats then
        SetVehicleMod(vehicleEntity, 32, props.modSeats, false)
    end
    if props.modSteeringWheel then
        SetVehicleMod(vehicleEntity, 33, props.modSteeringWheel, false)
    end
    if props.modShifterLeavers then
        SetVehicleMod(vehicleEntity, 34, props.modShifterLeavers, false)
    end
    if props.modAPlate then
        SetVehicleMod(vehicleEntity, 35, props.modAPlate, false)
    end
    if props.modSpeakers then
        SetVehicleMod(vehicleEntity, 36, props.modSpeakers, false)
    end
    if props.modTrunk then
        SetVehicleMod(vehicleEntity, 37, props.modTrunk, false)
    end
    if props.modHydrolic then
        SetVehicleMod(vehicleEntity, 38, props.modHydrolic, false)
    end
    if props.modEngineBlock then
        SetVehicleMod(vehicleEntity, 39, props.modEngineBlock, false)
    end
    if props.modAirFilter then
        SetVehicleMod(vehicleEntity, 40, props.modAirFilter, false)
    end
    if props.modStruts then
        SetVehicleMod(vehicleEntity, 41, props.modStruts, false)
    end
    if props.modArchCover then
        SetVehicleMod(vehicleEntity, 42, props.modArchCover, false)
    end
    if props.modAerials then
        SetVehicleMod(vehicleEntity, 43, props.modAerials, false)
    end
    if props.modTrimB then
        SetVehicleMod(vehicleEntity, 44, props.modTrimB, false)
    end
    if props.modTank then
        SetVehicleMod(vehicleEntity, 45, props.modTank, false)
    end
    if props.modWindows then
        SetVehicleMod(vehicleEntity, 46, props.modWindows, false)
    end

    if props.modLivery then
        SetVehicleMod(vehicleEntity, 48, props.modLivery, false)
        SetVehicleLivery(vehicleEntity, props.modLivery)
    end
end
