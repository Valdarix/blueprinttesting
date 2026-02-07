Bridge.Dispatch = Bridge.Dispatch or {}

Bridge.Dispatch.SendAlert = function(data)
    if Bridge.DispatchResource ~= 'ps-dispatch' then return end
    exports['ps-dispatch']:CustomAlert(data)
end
