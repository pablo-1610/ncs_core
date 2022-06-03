---isInConnectingList
---@param identifier string
---@return boolean
---@public
function MOD_Players:isInConnectingList(identifier)
    return (MOD_Players.selectedCharacter[identifier] ~= nil)
end