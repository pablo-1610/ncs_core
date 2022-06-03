_Internal.LogLevel = GetConvarInt("ncs_log_level", 3) or 3
_Internal.ServerName = GetConvar("sv_hostname", "N/A") or "N/A"
_Internal.OneSync = (GetConvar("onesync", "false") == "on") or false
_Internal.DefaultRoleIdentifier = (GetConvar("ncs_default_server_role", "off") == "on")