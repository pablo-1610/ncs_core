---hasWeapon
---@param weaponName string
---@return bool
---@public
function API_Player:hasWeapon(weaponName)
    if HasPedGotWeapon(PlayerPedId(), weaponName, false) == false then
        return false
    else
        return true
    end
end