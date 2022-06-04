---removeWeaponComponent
---@param pedId number
---@param weaponName string
---@param componentName string
---@public
function API_Ped:removeWeaponComponent(pedId, weaponName, componentName)
    if (not (DoesEntityExist(pedId))) then
        return NCS:die("Target ped doesn't exist")
    end

    local weaponHash = GetHashKey(weaponName)
    if API_Ped:hasWeapon(pedId, weaponHash) and API_Ped:hasWeaponComponent(pedId, weaponHash, componentName) then
        RemoveWeaponComponentFromPed(pedId, weaponHash, componentName)
    end
end
