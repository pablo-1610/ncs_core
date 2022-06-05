---fileExists
---@param filePath string
---@return boolean
---@public
function MOD_NoSQL:fileExists(filePath)
    local file = io.open(filePath, "r")
    if file then
        io.close(file)
        return (true)
    end
    return (false)
end