--[[
  This file is part of Meta RP.
  Created at 28/05/2022 00:09
  
  Copyright (c) Meta RP - All Rights Reserved
  
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author Pablo_1610

---@type table<number, NCSPlayer>
MOD_Players.list = {}

---set
---@param id number
---@param player NCSPlayer
function MOD_Players:set(id, player)
    self.list[id] = player
end

---get
---@param id number
---@return NCSPlayer
---@public
function MOD_Players:get(id)
    return (self.list[id])
end

---getAll
---@return table<number, NCSPlayer>
---@public
function MOD_Players:getAll()
    return (self.list)
end

---exists
---@param id number
---@return boolean
---@public
function MOD_Players:exists(id)
    return (self.list[id] ~= nil)
end