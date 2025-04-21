local M = {}

---@param c tairiki.Palette
---@param opts tairiki.Config
---@return tairiki.Highlights
function M.get(c, opts)
  local is_light = opts.palette:find("light") ~= nil
  local contrast_target = is_light and "#000000" or "#ffffff"
  local yellow = is_light and c.diag.warn or c.yellow
  local blue = is_light and c.fg or c.blue
  local util = require("tairiki.util")
  -- stylua: ignore
  return {
    CompileModeError            = { fg = c.red, bold = is_light }, -- { fg = Red }
    CompileModeWarning          = { fg = yellow, bold = is_light }, -- { fg = DarkYellow }
    CompileModeInfo             = { fg = is_light and util.darken(c.green, 0.8) or c.green, bold = is_light }, -- { fg = Green }

    CompileModeMessage          = { fg = c.none, underline = true, bold = is_light }, -- { fg = none, underline = true }
    CompileModeMessageRow       = { fg = c.purple, bold = is_light }, -- { fg = Magenta }
    CompileModeMessageCol       = { fg = c.cyan, bold = is_light }, -- { fg = Cyan }

    CompileModeCommandOutput    = { fg = blue, bold = is_light }, -- { fg = #6699ff }
    CompileModeDirectoryMessage = { fg = blue, bold = is_light }, -- { fg = #6699ff }
    CompileModeOutputFile       = { fg = c.purple, bold = true }, -- { fg = #9966cc }
    CompileModeCheckResult      = { fg = c.syn.constant, bold = true }, -- { fg = #ff9966, bold = true }
    CompileModeCheckTarget      = { fg = c.syn.constant },

    CompileModeErrorLocus       = "Visual", -- { link = Visual }
  }
end

return M
