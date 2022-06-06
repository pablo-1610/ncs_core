---clear
---@public
function MOD_Cache:clear()
   for key, _ in pairs(self.list) do
      self.list[key] = nil
   end
end