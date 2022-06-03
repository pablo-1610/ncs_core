---addMultipleChoicesInput
---@param id string
---@param label string
---@param placeholder string
---@param choices table
---@param isRequired boolean
function NCSAdaptiveCardBuilder:addMultipleChoicesInput(id, label, placeholder, choices, isRequired)
    for k, v in pairs(choices) do
        -- FIXME : Value seems to don't work when form is submitted
        choices[k] = {
            title = v[1],
            value = tonumber(v[2])
        }
    end
    table.insert(self.payload.body, {
        type = "Input.ChoiceSet",
        choices = choices,
        placeholder = placeholder,
        id = id,
        label = label,
        style = "compact",
        isRequired = isRequired
    })
    return (self)
end