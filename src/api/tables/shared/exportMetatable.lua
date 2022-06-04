---exportMetatable
---@public
---@param superclass table
---@param class table
---@return table
function API_Tables:exportMetatable(superclass, class)
    for name, v in pairs(superclass) do
        class[name] = function(o, ...)
            return (v(o, ...))
        end
    end
end