local baseMaxWeight = GetConvarInt("ncs_default_max_weight", 20)
NCSConstant.bagsWeight = {
	[40] = baseMaxWeight + 2, 
	[41] = baseMaxWeight + 3, 
	[44] = baseMaxWeight + 5, 
	[45] = baseMaxWeight + 3
}