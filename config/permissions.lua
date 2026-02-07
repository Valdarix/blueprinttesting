-- Permission levels mapped to QBCore job grades
-- Higher grade = more permissions
Config.Permissions = {
    -- Grade thresholds for actions
    viewProfiles = 0,       -- All officers
    editProfiles = 2,       -- Sergeant+
    createWarrants = 1,     -- Senior Officer+
    serveWarrants = 0,      -- All officers
    deleteWarrants = 3,     -- Lieutenant+
    createReports = 0,      -- All officers
    editReports = 1,        -- Senior Officer+
    createBolos = 0,        -- All officers
    deleteBolos = 2,        -- Sergeant+
    manageUnits = 2,        -- Sergeant+
    viewRoster = 0,         -- All officers
    editRoster = 3,         -- Lieutenant+
    manageDispatch = 2,     -- Sergeant+
    uploadEvidence = 0,     -- All officers
    deleteEvidence = 2,     -- Sergeant+
    editPenalCodes = 4,     -- Captain+
    manageDepartment = 4,   -- Captain+
}
