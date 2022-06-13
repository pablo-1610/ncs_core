---@class NCSCamera
---@field public id string
NCSCamera = {}
NCSCamera.__index = NCSCamera

---create
---@param coords table<number, number, number>
---@param heading number
---@return table
---@public
function API_Camera:create(coords, heading)
    local self = {}
    self.id = CreateCam("DEFAULT_SCRIPTED_CAMERA", 0)
    self.exist = DoesCamExist(self.id)

    SetCamCoord(self.id, coords)
    if heading then
        PointCamAtCoord(self.id, heading)
    end

    return setmetatable(self, NCSCamera)
end