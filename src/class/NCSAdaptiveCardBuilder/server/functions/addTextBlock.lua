---addTextBlock
---@param text string
---@return NCSAdaptiveCardBuilder
---@public
function NCSAdaptiveCardBuilder:addTextBlock(text)
    self.payload.body[#self.payload.body + 1] = {
        type = "TextBlock",
        text = text,
        wrap = true
    }
    return (self)
end