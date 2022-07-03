---giveItem
---@param itemName, string
---@param count number
---@param callback function
---@public
---@return void
function NCSCharacter:giveItem(itemName, count, callback)
    if (not MOD_Items:exists(itemName)) then
        callback(NCSEnum.ItemErrorType.ITEM_NOT_EXIST)
        return NCS:die(("The item ^3%s^7 does not exist !"):format(itemName or "INVALID"))
    end
    if (not MOD_Players:exists(self.user and self.user.serverId or 0)) then
        callback(NCSEnum.ItemErrorType.PLAYER_NOT_EXIST)
        return
    end
    ---@type NCSItems
    local item <const> = MOD_Items:get(itemName)

    if (self:getWeight() + item.weight * count > self:getMaxWeight()) then
        callback(NCSEnum.ItemErrorType.NOT_SUFFICIENT_PLACE)
        return
    end

    if (self.inventory.items[itemName]) then
        self.inventory.items[itemName].count = self.inventory.items[itemName].count + tonumber(count)
    else
        self.inventory.items[itemName] = {
            name = item.name,
            label = item.label,
            count = tonumber(count)
        }
    end

    callback(NCSEnum.ItemErrorType.SUCCESS)
end
