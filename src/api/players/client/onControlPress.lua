---onControlPress
---@param key string
---@param action function
function _NCS:onControlPress(key, action)
    if IsControlPressed(1, key) then
        if (IsControlJustReleased(1, key)) then
            if (action) then
                action()
            else
                _NCS:trace("no action defined", 4)
            end
            return true
        end
    else
        _NCS:trace("key not defind", 4)
    end
end


