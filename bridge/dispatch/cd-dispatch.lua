Bridge.Dispatch = Bridge.Dispatch or {}

Bridge.Dispatch.SendAlert = function(data)
    if Bridge.DispatchResource ~= 'cd_dispatch' then return end
    TriggerEvent('cd_dispatch:AddNotification', data)
end
