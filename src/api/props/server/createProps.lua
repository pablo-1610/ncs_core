---createprops
---@param props string
---@param X number
---@param Y number
---@param Z number
---@param H number
function API_Props:createprops(props,X,Y,Z,H)
    local object = CreateObject(props, X, Y, Z - 1, true)
    SetEntityHeading(object, H)
    FreezeEntityPosition(object, true)
end
