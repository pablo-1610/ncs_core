--list of input: https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/ 
API_Keybind.data = {
    --[[
    -- exemple of object struct

    ['KEY'] = {
        command = 'command_name',
        label = 'command_label',
        input = 'keyboard', -- look at list of input
        onPressed = function()
            -- logic press button
        end,

        -- optional

        onReleased = function()
            -- logic released button
        end
    }
    ]]
}