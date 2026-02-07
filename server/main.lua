local QBCore = exports['qb-core']:GetCoreObject()

-- Initialize bridge system
Bridge = Bridge or {}

--- Check if a player has permission for an action
---@param src number Player source
---@param permission string Permission key from Config.Permissions
---@return boolean
function HasPermission(src, permission)
    local player = QBCore.Functions.GetPlayer(src)
    if not player then return false end

    local job = player.PlayerData.job
    if not FoundationMDT.Utils.TableContains(Config.PoliceJobs, job.name) then
        return false
    end

    local requiredGrade = Config.Permissions[permission]
    if not requiredGrade then return false end

    return job.grade.level >= requiredGrade
end

--- Handle server callbacks from client
---@param event string Event name
---@param handler function Callback handler
function RegisterServerCallback(event, handler)
    RegisterNetEvent(event, function(requestId, ...)
        local src = source
        local result = handler(src, ...)
        TriggerClientEvent(event .. ':response:' .. requestId, src, result)
    end)
end

-- Resource start
AddEventHandler('onResourceStart', function(resource)
    if resource ~= GetCurrentResourceName() then return end
    if Config.Debug then
        print('^2[Foundation MDT] Resource started successfully^0')
    end
end)
