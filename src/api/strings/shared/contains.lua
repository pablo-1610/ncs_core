---contains
---@param stringToFind string
---@param pattern string
---@return boolean
---@public
function API_Strings:contains(stringToFind, pattern)
    return (stringToFind:find(pattern) ~= nil)
end