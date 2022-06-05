---getFullName
---@return string
---@public
---@param self NCSCharacter
function NCSCharacter.getFullName(self)
    return ("%s %s"):format(API_Strings:firstToUpper(self.identity.firstname:lower()), API_Strings:firstToUpper(self.identity.lastname:lower()))
end