---playAnimation
---@param dict string
---@param anim string
---@param flag number
---@param blendin number
---@param blendout number
---@param playbackRate number
---@param duration number
---@return nil
---@public
function API_Ped:playAnimation(ped, dict, anim, flag, blendin, blendout, playbackRate, duration)
    CreateThread(function()
        if (not (DoesEntityExist(ped))) then
            return _NCS:die("Target ped does not exists")
        end
    
        blendin = blendin or 1.0
        blendout = blendout or 1.0
        playbackRate = playbackRate or 1.0
        duration = duration or -1
    
        RequestAnimDict(dict)
        while (not (HasAnimDictLoaded(dict))) do
            Wait(1)
        end
        TaskPlayAnim(ped, dict, anim, blendin, blendout, duration, flag, playbackRate, 0, 0, 0)
        RemoveAnimDict(dict)
    end)
end
