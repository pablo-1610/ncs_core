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
    if (not (DoesEntityExist(ped))) then
        _NCS:die("Target ped does not exists")
    end

    if (blendin == nil) then
        blendin = 1.0
    end
    if (blendout == nil) then
        blendout = 1.0
    end
    if (playbackRate == nil) then
        playbackRate = 1.0
    end
    if (duration == nil) then
        duration = -1
    end

    RequestAnimDict(dict)
    while (not (HasAnimDictLoaded(dict))) do
        Wait(1)
    end
    TaskPlayAnim(ped, dict, anim, blendin, blendout, duration, flag, playbackRate, 0, 0, 0)
    RemoveAnimDict(dict)
end