---webhook
---@param webhookLink string
---@param webhookName string
---@param webhookAvatar string
---@param content string
---@param embeds Array
---@return void
---@public
function API_Discord:webhook(webhookLink, webhookName, webhookAvatar, content, embeds)
   PerformHttpRequest(
      webhookLink, 
      function(err, text, headers) end, 
      "POST", 
      json.encode(
         {
            username = webhookName, 
            avatar_url = webhookAvatar,
            content = content,
            embeds = embeds
         }
      ), 
      { 
         ["Content-Type"] = "application/json" 
      }
   )
end