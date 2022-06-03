local function GetNCS()
    return (_G.NCS)
end

local function GetEnums()
    return (_G.NCSEnum)
end

exports("getLibrary", GetNCS)
exports("getEnums", GetEnums)