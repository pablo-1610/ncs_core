---serverCreateObject
---@param props string
---@param x number
---@param y number
---@param z number
---@param h number
---@return void
---@public
function API_Objects:serverCreateObject(props, x, y, z, h)
    assert(type(props) == "string" or type(props) == "number")
    if type(props) == "string" then
        props = GetHashKey(props)
    end

    local object = CreateObject(props, x, y, z, true)
    SetEntityHeading(object, h)
    FreezeEntityPosition(object, true)
end
