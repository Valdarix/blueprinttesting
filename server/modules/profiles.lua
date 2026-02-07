--- Profiles / Citizens Module
--- Handles citizen lookups, profile management, criminal history

--- Search citizens by name or identifier
---@param src number Player source
---@param query string Search query
RegisterServerCallback('foundation-mdt:server:searchCitizens', function(src, query)
    if not HasPermission(src, 'viewProfiles') then return {} end

    -- TODO: Implement citizen search
    return {}
end)

--- Get full citizen profile
---@param src number Player source
---@param citizenId string Citizen identifier
RegisterServerCallback('foundation-mdt:server:getCitizenProfile', function(src, citizenId)
    if not HasPermission(src, 'viewProfiles') then return nil end

    -- TODO: Implement profile fetch
    return nil
end)

--- Update citizen profile notes or flags
---@param src number Player source
---@param citizenId string Citizen identifier
---@param data table Updated profile data
RegisterServerCallback('foundation-mdt:server:updateCitizenProfile', function(src, citizenId, data)
    if not HasPermission(src, 'editProfiles') then return false end

    -- TODO: Implement profile update
    return false
end)
