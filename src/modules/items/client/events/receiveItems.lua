NCS:registerNetEvent("receiveItems", function(data)
    MOD_Items.list[data.name] = {
        label = data.label,
        weight = data.weight,
    }
end)