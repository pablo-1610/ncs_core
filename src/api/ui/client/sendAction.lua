---sendAction
---@param moduleName string
---@param functionName string
---@param argsList table
---@return void
---@public
function API_UI:sendAction(moduleName, functionName, argsList)
   SendNUIMessage({
      moduleName = moduleName,
      functionName = functionName,
      argsList = argsList
   })
end