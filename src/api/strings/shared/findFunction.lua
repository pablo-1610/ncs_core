---findfunction
---@param funcName string
---@return function, string
---@public
function API_Strings:findFunction(funcName)
    assert(type(funcName) == "string")
    local f=_G
    for v in funcName:gmatch("[^%.]+") do
        if type(f) ~= "table" then
            return nil, "Expected function called: ^1"..funcName
        end
        f=f[v]
    end
    if type(f) == "function" then
        return f
    else
        return nil, "Expected function called: ^1"..funcName
    end
end