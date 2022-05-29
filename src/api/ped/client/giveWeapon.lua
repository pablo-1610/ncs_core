---giveWeapon
---@param ped number
---@param weaponName string
---@param ammo number
---@param isHidden boolean
---@param forceInHand boolean
---@return void
---@public

function API_Ped:giveWeapon(ped, weaponName, ammo, isHidden, forceInHand)
    local weaponHash = GetHashKey(weaponName)
    GiveWeaponToPed(ped, weaponHash, ammo, isHidden, forceInHand)
end