---registerAction
---@param moduleName string
---@param functionName string
---@param callback function
---@public
function MOD_UI:registerAction(moduleName, functionName, callback)
   RegisterNUICallback(("%s::%s"):format(moduleName, functionName), function(data)
      callback(data)
  end)  
end