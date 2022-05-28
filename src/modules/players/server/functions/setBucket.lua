---setBucket
---@param playerID number
---@param bucketID number
---@public
---@return void
function MOD_Players:setBucket(playerID, bucketID)
    SetEntityRoutingBucket(playerID, bucketID)
end
