---canUseRegisterKey
---@param Bool boolean
---@param ButtonIndex string
function _NCS:canUseRegisteredKey(bool, buttonIndex)
    if (type(bool) == 'boolean') then
        for _,v in pairs(registeredKeysTable) do
            if (buttonIndex) then
                if (v.key == string.upper(buttonIndex)) then
                    v.canUse = Bool
                end
            else
                v.canUse = Bool
            end
        end
    end
end
