Bridge.Prison = Bridge.Prison or {}

Bridge.Prison.SendToJail = function(src, time)
    if Bridge.PrisonResource ~= 'xt-prison' then return end
    TriggerEvent('xt-prison:server:jail', src, time)
end
