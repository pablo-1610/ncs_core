---requestWeaponAsset
---@param weaponHash string
---@param callback function
---@public
function API_Streaming:requestWeaponAsset(weaponHash, callback)
    if (not HasWeaponAssetLoaded(weaponHash)) then
        RequestWeaponAsset(weaponHash)
        while (not HasWeaponAssetLoaded(weaponHash)) do
            Wait(0)
        end
        return (weaponHash)
    end
end