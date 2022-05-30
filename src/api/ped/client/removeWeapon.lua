---removeWeapon
---@param pedId string
---@param weaponName string
---@return void
---@public
function API_Ped:removeWeapon(pedId, weaponName)
    if (not (DoesEntityExist(pedId))) then
        return _NCS:die("Target ped does not exists")
    end
    
    local weaponHash = GetHashKey(weaponName)
    RemoveWeaponFromPed(pedId, weaponHash)
end