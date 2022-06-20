---readFile
---@param filePath string
---@return string
---@public
function MOD_NoSQL:readFile(filePath)
    if (not (self:fileExists(filePath))) then
        NCS:trace(("Attempt to read file that does not exist: %s"):format(filePath), 1)
        return (nil)
    end
    local file = io.open(filePath, "r")
    if file then
        local content = file:read("*a")
        io.close(file)
        return (content)
    end
    return (nil)
end