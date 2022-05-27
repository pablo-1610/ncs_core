---firstToUpper
---@param str string
---@return string
---@public
function API_Strings:firstToUpper(str)
    return str:gsub("^%l", string.upper)
end