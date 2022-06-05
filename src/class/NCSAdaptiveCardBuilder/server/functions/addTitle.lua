---addTitle
---@param text string
---@return NCSAdaptiveCardBuilder
---@public
function NCSAdaptiveCardBuilder:addTitle(text)
    self.payload.body[#self.payload.body + 1] = {
        weight = "Bolder",
        type = "TextBlock",
        text = text,
        size = "Medium"
    }
    return (self)
end