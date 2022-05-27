---playAnimation
---@param dict string
---@param anim string
---@param flag number
---@param blendin number
---@param blendout number
---@param playbackRate number
---@param duration number
---@return void
---@public
function _NCS:playAnimation(dict, anim, flag, blendin, blendout, playbackRate, duration)
    if (blendin == nil) then blendin = 1.0 end
    if (blendout == nil) then blendout = 1.0 end
    if (playbackRate == nil) then playbackRate = 1.0 end
    if (duration == nil) then duration = -1 end
    RequestAnimDict(dict)
    while (not (HasAnimDictLoaded(dict))) do
        Wait(1)
    end
    TaskPlayAnim(PlayerPedId(), dict, anim, blendin, blendout, duration, flag, playbackRate, 0, 0, 0)
    RemoveAnimDict(dict)
end