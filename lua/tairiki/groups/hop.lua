local util = require("tairiki.util")
local M = {}

---@param c tairiki.Palette
---@param opts tairiki.Config
---@return tairiki.Highlights
function M.get(c, opts)
  -- stylua: ignore
  return {
    HopNextKey   = { fg = c.red, bold = true },
    HopNextKey1  = { fg = c.cyan, bold = true },
    HopNextKey2  = { fg = util.darken(c.blue, 0.7) },
    HopUnmatched = { fg = c.fg_dark3 },
    HopCursor    = { bg = c.fg },
  }
end

return M
