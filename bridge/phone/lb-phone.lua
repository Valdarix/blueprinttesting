Bridge.Phone = Bridge.Phone or {}

Bridge.Phone.SendNotification = function(src, data)
    if Bridge.PhoneResource ~= 'lb-phone' then return end
    exports['lb-phone']:SendNotification(src, data)
end
