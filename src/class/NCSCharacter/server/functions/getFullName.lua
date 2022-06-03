---getFullName
---@return string
---@public
function NCSCharacter:getFullName()
    return ("%s %s"):format(API_Strings:firstToUpper(self.identity.firstname:lower()), API_Strings:firstToUpper(self.identity.lastname:lower()))
end