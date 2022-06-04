---playAnimation
---@param pedId number
---@param dict string
---@param anim string
---@param flag number
---@param blendin number
---@param blendout number
---@param playbackRate number
---@param duration number
---@return void
---@public
function API_Ped:playAnimation(pedId, dict, anim, flag, blendin, blendout, playbackRate, duration)
    if (not (DoesEntityExist(pedId))) then
        return NCS:die("Target ped doesn't exist")
    end

    blendin = blendin or 1.0
    blendout = blendout or 1.0
    playbackRate = playbackRate or 1.0
    duration = duration or -1

    API_Streaming:requestAnimDict(dict)
    TaskPlayAnim(pedId, dict, anim, blendin, blendout, duration, flag, playbackRate, 0, 0, 0)
    RemoveAnimDict(dict)
end