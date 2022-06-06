---destroyOverride
---@public
function MOD_Time:destroyOverride()
    MOD_Time.isTimeOverride = nil
    NCS:triggerServerEvent("requestTimeSync")
end