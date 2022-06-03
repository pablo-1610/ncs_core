---build
---@return string
---@public
function NCSAdaptiveCardBuilder:build()
    return (json.encode(self.payload))
end