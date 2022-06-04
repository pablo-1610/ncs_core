NCSConstant.PublicClassFunctions = {
    ["NCSPlayer"] = {
        "disconnect",
        "minify",
        "onDataLoaded",
        "save",
        "sendData",
        "setCharacter",
        "setCharacterByIdentifier",
        "setLastSource",
        "triggerEvent",
        "hi"
    },

    ["NCSRole"] = {
        "addPermission",
        "hasPermission",
        "minify",
        "removePermission"
    },

    ["NCSCharacter"] = {
        "getFullName",
        "getSessionData",
        "initialize",
        "minify",
        "savePosition",
        "sessionDataExists",
        "setSessionData",
        "setUser",
        "warpToCharacterCustomization"
    }
}

setmetatable(NCSConstant.PublicClassFunctions, {
    __index = function()
        return ({})
    end
})