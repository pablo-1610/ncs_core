---firstToUpper
---@param stringToUpper string
---@return string
---@public
function API_Strings:firstToUpper(stringToUpper)
    return (str:gsub("^%l", string.upper))
end