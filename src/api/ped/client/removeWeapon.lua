---removeWeapon
---@param pedId string
---@param weaponName string
---@return void
---@public
function API_Ped:removeWeapon(pedId, weaponName)
    if (not (DoesEntityExist(pedId))) then
        return NCS:die("Target ped doesn't exist")
    end

    local weaponHash = GetHashKey(weaponName)
    RemoveWeaponFromPed(pedId, weaponHash)
end