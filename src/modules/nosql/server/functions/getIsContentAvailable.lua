---getIsContentAvailable
---@param fileName string
---@return string
---@public
function MOD_NoSQL:getIsContentAvailable(fileName)
    local resPath <const> = GetResourcePath(NCS.resourceName)
    local filePath <const> = ("%s%s.json"):format(("%s/data/"):format(resPath), fileName)
    return (self:fileExists(filePath))
end