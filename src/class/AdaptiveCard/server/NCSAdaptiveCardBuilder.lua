---@field public payload string
---@class NCSAdaptiveCardBuilder
NCSAdaptiveCardBuilder = {}

local __instance = {
    __index = NCSAdaptiveCardBuilder,
}

setmetatable(NCSAdaptiveCardBuilder, {
    __call = function(_)
        local self = setmetatable({}, __instance)
        self.payload = json.decode([[{"type":"AdaptiveCard","$schema":"http://adaptivecards.io/schemas/adaptive-card.json","version":"1.5"}]])
        self.payload.body = {}
        return (self)
    end
})

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

---addInput
---@param id string
---@param type string
---@param isRequired boolean
---@param label string
---@param placeholder string
function NCSAdaptiveCardBuilder:addInput(id, type, isRequired, label, placeholder)
    table.insert(self.payload.body, {
        type = type,
        id = id,
        isRequired = isRequired,
        label = label,
        placeholder = placeholder
    })
    return (self)
end

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

---build
---@return string
---@public
function NCSAdaptiveCardBuilder:build()
    return (json.encode(self.payload))
end