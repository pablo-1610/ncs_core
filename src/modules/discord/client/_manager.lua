---@type table<string, NCSRichePresence>
MOD_Discord.list = {}

---get
---@param name string
---@return NCSRichePresence
---@public
function MOD_Discord:get(name)
    return (self.list[name])
end

---getAll
---@return table<string, NCSRichePresence>
---@public
function MOD_Discord:getAll()
    return (self.list)
end

---exists
---@param name string
---@return boolean
---@public
function MOD_Discord:exists(name)
    return (self.list[name] ~= nil)
end