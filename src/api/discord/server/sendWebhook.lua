---sendWebhook
---@param webhook string
---@param details table
---@return void
---@public
function API_Discord.actions:sendWebhook(webhook, details)
    if (not webhook or not (details)) then
        return
    end
    local embedToSend <const> = {details}
    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({embeds = embedToSend}), { ['Content-Type'] = 'application/json' })
end
