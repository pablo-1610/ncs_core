---giveWeapon
---@param pedId number
---@param weaponName string
---@param ammo number
---@param isHidden boolean
---@param forceInHand boolean
---@return void
---@public
function API_Ped:giveWeapon(pedId, weaponName, ammo, isHidden, forceInHand)
    if (not (DoesEntityExist(pedId))) then
        return NCS:die("Target ped doesn't exist")
    end
    if (not (IsModelValid(GetHashKey(weaponName)))) then
        return NCS:die("Specified model isn't valid")
    end
    
    local weaponHash = GetHashKey(weaponName)
    GiveWeaponToPed(pedId, weaponHash, ammo, isHidden, forceInHand)
end