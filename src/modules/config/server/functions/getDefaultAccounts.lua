---getDefaultAccounts
---@return table
---@public
function MOD_Config:getDefaultAccounts()
    return ({ 
        cash = GetConvarInt("ncs_base_cash_money", 0), 
        blackMoney = GetConvarInt("ncs_base_black_money", 0) 
    })
end