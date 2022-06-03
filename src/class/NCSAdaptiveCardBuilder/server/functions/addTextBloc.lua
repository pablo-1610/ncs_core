---addTextBloc
---@param text string
---@return NCSAdaptiveCardBuilder
---@public
function NCSAdaptiveCardBuilder:addTextBloc(text)
    table.insert(self.payload.body, {
        type = "TextBlock",
        text = text,
        wrap = true
    })
    return (self)
end