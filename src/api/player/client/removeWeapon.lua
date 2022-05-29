---removeWeapon
---@param weaponName string
---@return void
---@public
function API_Player:removeWeapon(weaponName)
    local weaponHash = GetHashKey(weaponName)
    RemoveWeaponFromPed(PlayerPedId(), weaponHash)
end