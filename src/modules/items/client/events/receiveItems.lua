---@author Wz.
---@version 1.0
--[[

  This file is part of Wz Project.
  
  File [receiveItems.lua] created at [05/06/2022 17:02]
  Copyright (c) Wz - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
  
--]]

NCS:registerNetEvent("receiveItems", function(data)
    MOD_Items.list[data.name] = {
        label = data.label,
        weight = data.weight,
    }
end)