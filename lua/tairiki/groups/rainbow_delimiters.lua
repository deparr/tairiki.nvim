local M = {}

---@param c tairiki.Palette
---@param opts tairiki.Config
---@return tairiki.Highlights
function M.get(c, opts)
-- stylua: ignore
  return {
    RainbowDelimiterRed    = { fg = c.red },
    RainbowDelimiterYellow = { fg = c.yellow },
    RainbowDelimiterBlue   = { fg = c.blue },
    RainbowDelimiterOrange = { fg = c.orange },
    RainbowDelimiterGreen  = { fg = c.green },
    RainbowDelimiterViolet = { fg = c.purple },
    RainbowDelimiterCyan   = { fg = c.cyan },
  }
end

return M
