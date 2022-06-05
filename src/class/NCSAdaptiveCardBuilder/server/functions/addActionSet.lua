---addActionSet
---@param id string
---@return NCSAdaptiveCardBuilder
---@public
function NCSAdaptiveCardBuilder:addActionSet(id, actions)
    ---@param action table
    for _, action in pairs(actions) do
        action = {
            type = action.type,
            title = action.title,
            id = action.id
        }
    end
    self.payload.body[#self.payload.body + 1] = {
        type = "ActionSet",
        actions = actions,
        id = id
    }
    return (self)
end