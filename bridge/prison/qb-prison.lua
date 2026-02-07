Bridge.Prison = Bridge.Prison or {}

Bridge.Prison.SendToJail = function(src, time)
    if Bridge.PrisonResource ~= 'qb-prison' then return end
    TriggerEvent('prison:server:SetJailStatus', src, time)
end
