---setContent
---@param fileName string
---@param content string
---@return string
---@public
function MOD_NoSQL:setContent(fileName, content)
    local resPath <const> = GetResourcePath(NCS.resourceName)
    local filePath <const> = ("%s%s.json"):format(("%s/data/"):format(resPath), fileName)
    return (self:writeFile(filePath, json.encode(content)))
end