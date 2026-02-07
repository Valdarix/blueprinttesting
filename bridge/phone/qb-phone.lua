Bridge.Phone = Bridge.Phone or {}

Bridge.Phone.SendNotification = function(src, data)
    if Bridge.PhoneResource ~= 'qb-phone' then return end
    TriggerClientEvent('qb-phone:client:notify', src, data)
end
