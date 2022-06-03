---addTitle
---@param text string
---@return NCSAdaptiveCardBuilder
---@public
function NCSAdaptiveCardBuilder:addTitle(text)
    table.insert(self.payload.body, {
        weight = "Bolder",
        type = "TextBlock",
        text = text,
        size = "Medium"
    })
    return (self)
end