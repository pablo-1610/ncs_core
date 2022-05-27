---contains
---@param str string
---@param otherStr string
---@return boolean
---@public
function API_Strings:contains(str, otherStr)
    return (str:find(otherStr) ~= nil)
end

