-- NUI message utilities for Foundation MDT

--- Send data to the NUI
---@param action string
---@param data table|nil
function SendToNUI(action, data)
    SendNUIMessage({
        action = action,
        data = data or {}
    })
end

-- Listen for NUI-forwarded events from the server
RegisterNetEvent('foundation-mdt:client:nuiUpdate', function(action, data)
    SendToNUI(action, data)
end)
