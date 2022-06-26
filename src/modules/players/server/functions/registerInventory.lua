local query = "INSERT INTO ncs_inventories (character_id, max_weight, allowed_content, accounts, weapons, items) VALUES (@character_id, @max_weight, @allowed_content, @accounts, \"[]\", \"[]\")"

---registerInventory
---@param characterId number
---@param callback function
---@public
---@return void
function MOD_Players:registerInventory(characterId, callback)
    API_Database:insert(query, {
        ["@character_id"] = tonumber(characterId),
        ["@max_weight"] = GetConvarInt("ncs_default_max_weight", 20),
        ["@allowed_content"] = "[]",
        ["@accounts"] = json.encode({ { type = NCSEnum.AccountsType.CASH_MONEY, money = GetConvarInt("ncs_base_cash_money", 1000) }, { type = NCSEnum.AccountsType.BLACK_MONEY, money = GetConvarInt("ncs_base_black_money", 0)} }),
    }, function(row)
        callback(row)
    end)
end
