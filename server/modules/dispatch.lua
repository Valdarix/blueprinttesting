--- Dispatch / Calls Module
--- Handles dispatch calls, active calls tracking, and unit coordination

--- Get active dispatch calls
---@param src number Player source
RegisterServerCallback('foundation-mdt:server:getActiveCalls', function(src)
    if not HasPermission(src, 'viewCalls') then return {} end

    -- TODO: Implement active calls listing
    return {}
end)

--- Create a new dispatch call
---@param src number Player source
---@param data table Call data (type, location, description, priority)
RegisterServerCallback('foundation-mdt:server:createCall', function(src, data)
    if not HasPermission(src, 'manageCalls') then return false end

    -- TODO: Implement call creation and bridge dispatch notification
    return false
end)

--- Update call status or details
---@param src number Player source
---@param callId number Call ID
---@param data table Updated call data
RegisterServerCallback('foundation-mdt:server:updateCall', function(src, callId, data)
    if not HasPermission(src, 'manageCalls') then return false end

    -- TODO: Implement call update
    return false
end)

--- Attach to a call (self-assign)
---@param src number Player source
---@param callId number Call ID
RegisterServerCallback('foundation-mdt:server:attachToCall', function(src, callId)
    if not HasPermission(src, 'viewCalls') then return false end

    -- TODO: Implement call attachment
    return false
end)
