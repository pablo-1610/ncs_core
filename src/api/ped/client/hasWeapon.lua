---hasWeapon
---@param pedId string
---@param weaponName string
---@return bool
---@public
function API_Ped:hasWeapon(pedId, weaponName)
    if HasPedGotWeapon(pedId, weaponName, false) == false then
        return false
    else
        return true
    end
end