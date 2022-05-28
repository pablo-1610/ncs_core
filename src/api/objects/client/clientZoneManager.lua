API_Objects.ZoneLoad = {}

---clientCreateZone
---@param x number
---@param y number
---@param z number
---@param r number
---@param g number
---@param b number
---@param a number
---@param h1 number
---@param h2 number
---@param h3 number
---@param id number
---@param action table
---@return void
---@public
function API_Objects:clientCreateZone(x,y,z,r,g,b,a,h1,h2,h3,id,action)
    table.insert(API_Objects.ZoneLoad,{
        x = x,
        y = y,
        z = z,
        action = action
    })
    API_Objects:clientCreateCheckpoint(id,x,y,z,r,g,b,a,h1,h2,h3)
end

CreateThread(function()
    while true do
        local Waito = 1000
        for k,v in pairs(API_Objects.ZoneLoad)do
            if v == '[]' then return end
            local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
            local dist = GetDistanceBetweenCoords(x, y, z,v.x,v.y,v.z,true)
            if dist <= 1 then
                Waito = 0
                if IsControlJustPressed(0,38) then
                    v.action()
                end
            elseif dist >= 1 then
                Waito = 1000
            end
        end
        Wait(Waito)
    end
end)

-- exemple for create zone client side

--RegisterCommand('test',function()
--    local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
--    API_Objects:clientCreateZone(x,y,z,0,0,255,255,1.0,1.0,1.0,47, function()
--        print('test')
--    end)
--end)