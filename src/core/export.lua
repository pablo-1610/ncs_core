local function GetNCS()
    return (_G._NCS)
end

local function GetEnums()
    return (_G._NCSEnum)
end

exports("get", GetNCS)
exports("getEnums", GetEnums)