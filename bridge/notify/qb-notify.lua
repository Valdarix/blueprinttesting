Bridge.Notify = Bridge.Notify or {}

Bridge.Notify.Send = function(msg, type, src)
    if Bridge.NotifyResource ~= 'qb-core' then return end
    if src then
        TriggerClientEvent('QBCore:Notify', src, msg, type)
    else
        TriggerEvent('QBCore:Notify', msg, type)
    end
end
