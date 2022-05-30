---@class NCSCamera
---@field public id string
NCSCamera = {}
NCSCamera.__index = NCSCamera


--- createCamera
---@param cameraCoords table
---@param cameraHeading number
---@return Camera
---@public
function API_Camera:createCamera(cameraCoords, cameraHeading)
    local self = {}

    self.id = CreateCam("DEFAULT_SCRIPTED_CAMERA", 0)
    self.exist = DoesCamExist(self.id)

    SetCamCoord(self.id, cameraCoords)
    if cameraHeading then
        PointCamAtCoord(self.id, cameraHeading)
    end

    return setmetatable(self, NCSCamera)
end