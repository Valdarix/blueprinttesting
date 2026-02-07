local QBCore = exports['qb-core']:GetCoreObject()
local isOpen = false

-- Open MDT
local function openMDT()
    local playerData = QBCore.Functions.GetPlayerData()
    if not playerData or not playerData.job then return end

    local isPolice = FoundationMDT.Utils.TableContains(Config.PoliceJobs, playerData.job.name)
    if not isPolice then
        Bridge.Notify.Send('You do not have access to the MDT', 'error')
        return
    end

    if playerData.job.grade.level < Config.MinimumGrade then
        Bridge.Notify.Send('Insufficient rank to access the MDT', 'error')
        return
    end

    isOpen = true
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = 'open',
        data = {
            player = {
                name = playerData.charinfo.firstname .. ' ' .. playerData.charinfo.lastname,
                callsign = playerData.metadata.callsign or 'N/A',
                job = playerData.job.name,
                grade = playerData.job.grade.name,
                gradeLevel = playerData.job.grade.level,
            },
            department = Config.Departments[playerData.job.name] or {},
        }
    })
end

-- Close MDT
local function closeMDT()
    if not isOpen then return end
    isOpen = false
    SetNuiFocus(false, false)
    SendNUIMessage({ action = 'close' })
end

-- Keybind
RegisterCommand('openMDT', function()
    if isOpen then
        closeMDT()
    else
        openMDT()
    end
end, false)

RegisterKeyMapping('openMDT', 'Open Foundation MDT', 'keyboard', Config.OpenKey)

-- Chat command
if Config.CommandName then
    RegisterCommand(Config.CommandName, function()
        if isOpen then
            closeMDT()
        else
            openMDT()
        end
    end, false)
end

-- NUI close callback
RegisterNUICallback('close', function(_, cb)
    closeMDT()
    cb({})
end)

-- Forward NUI callbacks to server
RegisterNUICallback('serverCallback', function(data, cb)
    local action = data.action
    local payload = data.data or {}

    TriggerServerCallback('foundation-mdt:server:' .. action, function(result)
        cb(result or {})
    end, payload)
end)

-- Utility: Trigger server callback with response
function TriggerServerCallback(event, cb, ...)
    local requestId = GetGameTimer()
    RegisterNetEvent(event .. ':response:' .. requestId, function(result)
        cb(result)
    end)
    TriggerServerEvent(event, requestId, ...)
end

-- Clean up on resource stop
AddEventHandler('onResourceStop', function(resource)
    if resource ~= GetCurrentResourceName() then return end
    if isOpen then
        closeMDT()
    end
end)
