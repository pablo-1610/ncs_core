---onPress
---@param Key string
---@param Action function
function _NCS:onControlPress(Key, Action)
    Key = string.upper(Key)
    if KeyList[Key] then
        if (IsControlJustReleased(1, KeyList[Key])) then
            if (Action) then
                Action()
            else
                _NCS:trace("no action defined", 4)
            end
            return true
        end
    else
        _NCS:trace("key not defind", 4)
    end
end


