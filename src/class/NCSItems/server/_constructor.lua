---@field public name string
---@field public label string
---@field public weight number
---@class NCSItems
NCSItems = {}
NCSItems.className = "NCSItems"

local __instance = {
    __index = NCSItems,
}

setmetatable(NCSItems, {
    __call = function(_, name, label, weight)
        local self = setmetatable({}, __instance)

        self.name = name
        self.label = label
        self.weight = weight
        self.inventoryName = {}

        self.export = function()
            return (API_Tables:exportMetatable(self, function(item)
                return (MOD_Items:get(item.name))
            end))
        end

        API_Tables:exportMetatable(NCSItems, self)

        return (self)
    end
})