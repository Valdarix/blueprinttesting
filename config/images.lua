-- Image upload provider configuration
Config.Images = {
    -- Maximum file size in MB
    maxFileSize = 5,

    -- Allowed file types
    allowedTypes = { 'image/png', 'image/jpeg', 'image/webp' },

    -- Discord webhook settings
    discord = {
        webhook = Config.DiscordWebhook or '',
    },

    -- FiveManage settings
    fivemanage = {
        apiKey = Config.FiveManageApiKey or '',
    },
}
