--- Penal Codes Module
--- Serves penal code data from config to the NUI

--- Get all penal codes
---@param src number Player source
RegisterServerCallback('foundation-mdt:server:getPenalCodes', function(src)
    if not HasPermission(src, 'viewProfiles') then return {} end

    return Config.PenalCodes or {}
end)
