---hasWeaponComponent
---@param pedId number
---@param weaponName string
---@param componentName string
---@return bool
---@public
function API_Ped:hasWeaponComponent(pedId, weaponName, componentName)
    return HasPedGotWeaponComponent(pedId, weaponName, componentName, false) == 1
end