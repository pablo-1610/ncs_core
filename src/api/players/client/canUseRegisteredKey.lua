---canUseRegisterKey
---@param Bool boolean
---@param ButtonIndex string
function _NCS:canUseRegisteredKey(Bool, ButtonIndex)
    if (type(Bool) == 'boolean') then
        for _,v in pairs(registeredKeysTable) do
            if (ButtonIndex) then
                if (v.key == string.upper(ButtonIndex)) then
                    v.canUse = Bool
                end
            else
                v.canUse = Bool
            end
        end
    end
end