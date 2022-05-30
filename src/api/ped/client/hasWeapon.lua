---hasWeapon
---@param pedId string
---@param weaponName string
---@return bool
---@public
function API_Ped:hasWeapon(pedId, weaponName)
    return HasPedGotWeapon(pedId, weaponName, false) == 1
end
