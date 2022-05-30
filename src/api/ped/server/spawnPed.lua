---spawn
---@param modelName string
---@param x number
---@param y number
---@param z number
---@param heading number
---@return ped
---@public
function API_Ped:spawn(modelName, x, y, z, heading)
    assert(type(modelName) == "string" or type(modelName) == "number")
    if type(modelName) == "string" then
        modelName = GetHashKey(modelName)
    end

    local ped <const> = CreatePed(1, modelName, x, y, z, heading)
    repeat
        Wait(0)
    until DoesEntityExist(ped)
    return ped
end
