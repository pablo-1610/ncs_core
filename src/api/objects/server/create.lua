---create
---@param prop string
---@param x number
---@param y number
---@param z number
---@param heading number
---@param freeze boolean
---@return number
---@public
function API_Objects:create(prop, x, y, z, heading, freeze)
    assert(type(prop) == "string" or type(prop) == "number")
    if type(prop) == "string" then
        prop = GetHashKey(prop)
    end
    local object <const> = CreateObject(prop, x, y, z, true)
    SetEntityHeading(object, heading)
    FreezeEntityPosition(object, freeze or false)
    return (object)
end