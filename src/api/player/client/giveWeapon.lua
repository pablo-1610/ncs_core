---giveWeapon
---@param weaponName string
---@param ammo number
---@param isHidden boolean
---@param forceInHand boolean
---@return void
---@public

function API_Player:giveWeapon(weaponName, ammo, isHidden, forceInHand)
    local weaponHash = GetHashKey(weaponName)
    GiveWeaponToPed(PlayerPedId(), weaponHash, ammo, isHidden, forceInHand)
end