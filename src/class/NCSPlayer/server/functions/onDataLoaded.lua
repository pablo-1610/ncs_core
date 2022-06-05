---onDataLoaded
---@param callback function
---@public
---@param self NCSPlayer
function NCSPlayer.onDataLoaded(self, callback)
    CreateThread(function()
        while (not (self.dataLoaded)) do
            Wait(100)
        end
        callback()
    end)
end