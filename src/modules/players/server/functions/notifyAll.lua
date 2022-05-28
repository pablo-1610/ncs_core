---notifyAll
---@param msg string
---@return void
---@public
function MOD_Players:notifyAll(msg)
    for _, player in pairs(MOD_Players:getAll()) do
        player:notify(msg)
    end
end