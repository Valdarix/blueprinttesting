Config = Config or {}

-- General Settings
Config.Debug = false
Config.OpenKey = 'F11' -- Keybind to open the MDT
Config.CommandName = 'mdt' -- Chat command to open MDT

-- Police Jobs (QBCore job names that can access the MDT)
Config.PoliceJobs = {
    'police',
    'bcso',
    'sasp',
    'rangers',
}

-- Minimum grade required to access the MDT (0 = all grades)
Config.MinimumGrade = 0

-- Search Settings
Config.MaxSearchResults = 50
Config.SearchDebounceMs = 300

-- Image Upload Provider: 'discord' or 'fivemanage'
Config.ImageProvider = 'discord'

-- Discord Webhook (if ImageProvider = 'discord')
Config.DiscordWebhook = ''

-- FiveManage API Key (if ImageProvider = 'fivemanage')
Config.FiveManageApiKey = ''

-- Notification Settings
Config.EnableSounds = true
