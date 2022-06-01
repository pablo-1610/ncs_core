---requestWeaponAsset
---@param weaponHash any
---@return number
---@public
function API_Streaming:requestWeaponAsset(weaponHash)
    if (HasWeaponAssetLoaded(weaponHash)) then
        return (weaponHash)
    end
    
    RequestWeaponAsset(weaponHash)
    while (not HasWeaponAssetLoaded(weaponHash)) do
        Wait(0)
    end
    return (weaponHash)
end