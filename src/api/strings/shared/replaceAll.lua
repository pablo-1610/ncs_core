---replaceAll
---@param str string
---@param find string
---@param replace string
---@return string
function API_Strings:replaceAll(str, find, replace)
    return (str:gsub(find, replace))
end