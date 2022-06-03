---hasWeapon
---@param pedId number
---@param weaponName string
---@return boolean
---@public
function API_Ped:hasWeapon(pedId, weaponName)
    if (not (DoesEntityExist(pedId))) then
        return NCS:die("Target ped doesn't exist")
    end
    
    return (HasPedGotWeapon(pedId, weaponName, false) == 1)
end
