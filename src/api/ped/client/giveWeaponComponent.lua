---giveWeaponComponent
---@param pedId number
---@param weaponName string
---@param componentName string
---@public
function API_Ped:giveWeaponComponent(pedId, weaponName, componentName)
    if (not (DoesEntityExist(pedId))) then
        return _NCS:die("Target ped does not exists")
    end
    
    local weaponHash <const> = GetHashKey(weaponName)
    if (API_Ped:hasWeapon(pedId, weaponHash) and not (API_Ped:hasWeaponComponent(pedId, weaponHash, componentName))) then
        GiveWeaponComponentToPed(pedId, weaponHash, componentName)
    end
end
