--- Unit Management Module
--- Handles active units, status tracking, and assignments

--- Get all active units
---@param src number Player source
RegisterServerCallback('foundation-mdt:server:getUnits', function(src)
    if not HasPermission(src, 'viewUnits') then return {} end

    -- TODO: Implement active units listing
    return {}
end)

--- Set unit status (10-8, 10-7, 10-6, etc.)
---@param src number Player source
---@param status string Unit status code
RegisterServerCallback('foundation-mdt:server:setUnitStatus', function(src, status)
    if not HasPermission(src, 'manageUnits') then return false end

    -- TODO: Implement unit status update
    return false
end)

--- Assign unit to a call
---@param src number Player source
---@param callId number Call/dispatch ID
RegisterServerCallback('foundation-mdt:server:assignUnitToCall', function(src, callId)
    if not HasPermission(src, 'manageUnits') then return false end

    -- TODO: Implement unit assignment
    return false
end)
