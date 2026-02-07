FoundationMDT = FoundationMDT or {}
FoundationMDT.Utils = {}

--- Check if a value exists in a table
---@param tbl table
---@param value any
---@return boolean
function FoundationMDT.Utils.TableContains(tbl, value)
    for _, v in ipairs(tbl) do
        if v == value then
            return true
        end
    end
    return false
end
