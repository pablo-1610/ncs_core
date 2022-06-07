---getByIdentifier
---@param identifier string
---@return NCSPlayer
---@public
function MOD_Players:getByIdentifier(identifier)
    return (MOD_Players.listByIdentifier[identifier])
end