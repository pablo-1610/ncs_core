---firstToUpper
---@param stringToUpper string
---@return string
---@public
function API_Strings:firstToUpper(stringToUpper)
    return (stringToUpper:gsub("^%l", string.upper))
end
