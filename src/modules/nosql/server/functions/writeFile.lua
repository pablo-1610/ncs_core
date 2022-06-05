---writeFile
---@param filePath string
---@param content string
---@return boolean
---@public
function MOD_NoSQL:writeFile(filePath, content)
    local file = io.open(filePath, "w")
    if file then
        file:write(content)
        io.close(file)
        return (true)
    end
    return (false)
end