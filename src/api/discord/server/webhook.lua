---webhook
---@param webhookLink string
---@param webhookOptions Array
---@return void
---@public
function API_Discord:webhook(webhookLink, webhookOptions)
   PerformHttpRequest(
      webhookLink, 
      function(err, text, headers) end, 
      "POST", 
      json.encode(webhookOptions), 
      { 
         ["Content-Type"] = "application/json" 
      }
   )
end
