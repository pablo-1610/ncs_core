---removeItem
---@param itemName string
---@param callback function
---@public
---@return void
function NCSCharacter:removeItem(itemName, count,  callback)
    if (not MOD_Items:exists(itemName)) then
        callback(NCSEnum.ItemErrorType.ITEM_NOT_EXIST)
        return NCS:die(("The item ^3%s^7 does not exist !"):format(itemName or "INVALID"))
    end
    if (not MOD_Players:exists(self.user and self.user.serverId or 0)) then
        callback(NCSEnum.ItemErrorType.PLAYER_NOT_EXIST)
        return
    end

    count = tonumber(count)

    if (self:hasItem(itemName, count)) then
        if (self:getItemCount(itemName) > count) then
            self.inventory.items[itemName].count = self.inventory.items[itemName].count - count
        else
            self.inventory.items[itemName] = nil
        end
    else
        callback(NCSEnum.ItemErrorType.NOT_PLAYER_HAS_ITEM)
    end
end