---setBucket
---@param playerID number
---@param bucketID number
function MOD_Players:setBucket(playerID, bucketID)
    SetEntityRoutingBucket(playerID, bucketID)
end