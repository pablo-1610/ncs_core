---giveWeaponComponent
---@param pedId number
---@param weaponName string
---@param componentName string
---@return void
---@public
function API_Ped:giveWeaponComponent(pedId, weaponName, componentName)
    local weaponHash = GetHashKey(weaponName)
    if API_Ped:hasWeapon(pedId, weaponHash) and not API_Ped:hasWeaponComponent(pedId, weaponHash, componentName) then
        GiveWeaponComponentToPed(pedId, weaponHash, componentName)
    end
end
