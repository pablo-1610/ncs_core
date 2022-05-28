---@type table<string, NCSBot>
MOD_Bots.list = {}

---get
---@param name string
---@return NCSBot
---@public
function MOD_Bots:get(name)
    return (self.list[name])
end

---getAll
---@return table<string, NCSBot>
---@public
function MOD_Bots:getAll()
    return (self.list)
end

---exists
---@param name string
---@return boolean
---@public
function MOD_Bots:exists(name)
    return (self.list[name] ~= nil)
end