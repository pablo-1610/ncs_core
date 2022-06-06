NCS:onReady(function()
    API_KeyBind:bind("interaction", "e", _Literals.BIND_INTERACTION_KEY, function()
        for _, listener in pairs(MOD_InteractionKey.listeners) do
            listener()
        end
    end)
end)