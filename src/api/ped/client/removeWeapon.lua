---removeWeapon
---@param pedId string
---@param weaponName string
---@return void
---@public
function API_Ped:removeWeapon(pedId, weaponName)
    local weaponHash = GetHashKey(weaponName)
    RemoveWeaponFromPed(pedId, weaponHash)
end