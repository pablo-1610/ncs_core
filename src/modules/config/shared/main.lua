NCSInternal.LogLevel = GetConvarInt("ncs_log_level", 3) or 3
NCSInternal.ServerName = GetConvar("sv_hostname", "N/A") or "N/A"
NCSInternal.OneSync = (GetConvar("onesync", "false") == "on") or false
NCSInternal.DefaultRoleIdentifier = (GetConvar("ncs_default_server_role", "off") == "on")