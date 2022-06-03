---hasWeaponComponent
---@param pedId number
---@param weaponName string
---@param componentName string
---@return boolean
---@public
function API_Ped:hasWeaponComponent(pedId, weaponName, componentName)
    if (not (DoesEntityExist(pedId))) then
        return NCS:die("Target ped does not exists")
    end
    
    return (HasPedGotWeaponComponent(pedId, weaponName, componentName, false) == 1)
end