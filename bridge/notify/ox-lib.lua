Bridge.Notify = Bridge.Notify or {}

Bridge.Notify.Send = function(msg, type, src)
    if Bridge.NotifyResource ~= 'ox_lib' then return end
    if src then
        TriggerClientEvent('ox_lib:notify', src, { description = msg, type = type })
    else
        lib.notify({ description = msg, type = type })
    end
end
