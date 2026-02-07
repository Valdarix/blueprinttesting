-- Bridge Loader: Auto-detect and load integrations
Bridge = Bridge or {}

local function isResourceStarted(resourceName)
    return GetResourceState(resourceName) == 'started'
end

local function loadBridge(category, resourceName, filePath)
    if Config.Debug then
        print(('[Foundation MDT] Loaded %s bridge: %s'):format(category, resourceName))
    end
end

-- Detect and load Dispatch bridge
if isResourceStarted('ps-dispatch') then
    Bridge.DispatchResource = 'ps-dispatch'
elseif isResourceStarted('cd_dispatch') then
    Bridge.DispatchResource = 'cd_dispatch'
else
    Bridge.DispatchResource = 'none'
end

-- Detect and load Prison bridge
if isResourceStarted('qb-prison') then
    Bridge.PrisonResource = 'qb-prison'
elseif isResourceStarted('xt-prison') then
    Bridge.PrisonResource = 'xt-prison'
else
    Bridge.PrisonResource = 'none'
end

-- Detect and load Phone bridge
if isResourceStarted('qb-phone') then
    Bridge.PhoneResource = 'qb-phone'
elseif isResourceStarted('lb-phone') then
    Bridge.PhoneResource = 'lb-phone'
else
    Bridge.PhoneResource = 'none'
end

-- Detect and load Notify bridge
if isResourceStarted('ox_lib') then
    Bridge.NotifyResource = 'ox_lib'
elseif isResourceStarted('qb-core') then
    Bridge.NotifyResource = 'qb-core'
else
    Bridge.NotifyResource = 'none'
end

if Config.Debug then
    print('^2[Foundation MDT] Bridge Detection Results:^0')
    print(('  Dispatch: %s'):format(Bridge.DispatchResource))
    print(('  Prison: %s'):format(Bridge.PrisonResource))
    print(('  Phone: %s'):format(Bridge.PhoneResource))
    print(('  Notify: %s'):format(Bridge.NotifyResource))
end
