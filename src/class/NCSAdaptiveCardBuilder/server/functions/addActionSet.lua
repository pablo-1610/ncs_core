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
    table.insert(self.payload.body, {
        type = "ActionSet",
        actions = actions,
        id = id
    })
    return (self)
end