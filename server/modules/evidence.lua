--- Evidence / Mugshots Module
--- Handles evidence uploads, mugshots, and image management

--- Get evidence for a report or citizen
---@param src number Player source
---@param linkedType string Type of link ('report' or 'citizen')
---@param linkedId string|number Linked entity ID
RegisterServerCallback('foundation-mdt:server:getEvidence', function(src, linkedType, linkedId)
    if not HasPermission(src, 'viewEvidence') then return {} end

    -- TODO: Implement evidence listing
    return {}
end)

--- Upload evidence (image URL after upload to Discord/FiveManage)
---@param src number Player source
---@param data table Evidence data (imageUrl, description, linkedType, linkedId)
RegisterServerCallback('foundation-mdt:server:uploadEvidence', function(src, data)
    if not HasPermission(src, 'uploadEvidence') then return false end

    -- TODO: Implement evidence record creation
    return false
end)

--- Delete evidence
---@param src number Player source
---@param evidenceId number Evidence ID
RegisterServerCallback('foundation-mdt:server:deleteEvidence', function(src, evidenceId)
    if not HasPermission(src, 'deleteEvidence') then return false end

    -- TODO: Implement evidence deletion
    return false
end)
