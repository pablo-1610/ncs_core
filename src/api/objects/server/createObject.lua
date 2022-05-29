---createObject
---@param prop string
---@param x number
---@param y number
---@param z number
---@param heading number
---@return void
---@public
function API_Objects:createObject(prop, x, y, z, heading)
    assert(type(prop) == "string" or type(prop) == "number")
    if type(prop) == "string" then
        props = GetHashKey(prop)
    end
    local object = CreateObject(prop, x, y, z, true)
    SetEntityHeading(object, heading)
    FreezeEntityPosition(object, true)
end
