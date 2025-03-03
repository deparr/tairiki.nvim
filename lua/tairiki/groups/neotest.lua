local M = {}

---@param c tairiki.Palette
---@param opts tairiki.Config
---@return tairiki.Highlights
function M.get(c, opts)
  -- stylua: ignore
  return {
    NeotestAdapterName  = { fg = c.purple, bold = true },
    NeotestDir          = { fg = c.cyan },
    NeotestExpandMarker = { fg = c.fg_dark3 },
    NeotestFailed       = { fg = c.red },
    NeotestFile         = { fg = c.cyan },
    NeotestFocused      = { bold = true, italic = true },
    NeotestIndent       = { fg = c.fg_dark3 },
    NeotestMarked       = { fg = c.orange, bold = true },
    NeotestNamespace    = { fg = c.blue },
    NeotestPassed       = { fg = c.green },
    NeotestRunning      = { fg = c.yellow },
    NeotestWinSelect    = { fg = c.cyan, bold = true },
    NeotestSkipped      = { fg = c.fg_dark2 },
    NeotestTarget       = { fg = c.purple },
    NeotestTest         = { fg = c.fg },
    NeotestUnknown      = { fg = c.fg_dark2 },
  }
end

return M
