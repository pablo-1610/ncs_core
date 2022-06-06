local defaultModel <const> = "mp_m_freemode_01"

---spawn
---@param coords table
---@param callback function
---@public
function API_Player:spawn(coords, callback)
    local position <const>, heading <const> = coords.position, coords.heading
    CreateThread(function()
        DoScreenFadeOut(500)

        while (IsScreenFadingOut()) do
            Wait(0)
        end

        self:freeze(PlayerId(), true)

        API_Streaming:requestModel(defaultModel)
        self:setModel(defaultModel)

        SetPedDefaultComponentVariation(PlayerPedId())

        RequestCollisionAtCoord(position.x, position.y, position.z)

        local ped <const> = PlayerPedId()

        SetEntityCoordsNoOffset(ped, position.x, position.y, position.z, false, false, false, true)
        SetEntityHeading(ped, heading)

        NetworkResurrectLocalPlayer(position.x, position.y, position.z, heading, true, true, false)

        API_Ped:setInvincible(ped, false)
        ClearPedBloodDamage(ped)
        ClearPedTasksImmediately(ped)
        RemoveAllPedWeapons(ped)
        ClearPlayerWantedLevel(PlayerId())

        ShutdownLoadingScreen()

        DoScreenFadeIn(500)

        while (IsScreenFadingIn()) do
            Wait(0)
        end

        self:freeze(PlayerId(), false)

        if (callback) then
            callback()
        end
    end)
end