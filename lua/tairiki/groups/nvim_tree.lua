local util = require("tairiki.util")
local M = {}

---@param c tairiki.Palette
---@param opts tairiki.Config
---@return tairiki.Highlights
function M.get(c, opts)
  -- stylua: ignore
  return {
    NvimTreeNormal         = { fg = c.fg, bg = opts.transparent and c.none or c.bg_light },
    NvimTreeVertSplit      = { fg = c.bg_light, bg = opts.transparent and c.none or c.bg_light },
    NvimTreeWinSeparator   = { fg = c.bg_light, bg = opts.transparent and c.none or c.bg_light },
    NvimTreeEndOfBuffer    = { fg = opts.end_of_buffer and c.bg_light2 or c.bg_light, bg = opts.transparent and c.none or c.bg_light, },
    NvimTreeExecFile       = { fg = c.green },
    NvimTreeFileIcon       = { fg = c.fg_dark3 },
    NvimTreeFolderIcon     = { fg = util.blend(c.blue, c.fg_dark2, 0.6) },
    NvimTreeFolderName     = { fg = c.blue },
    NvimTreeGitDeleted     = { fg = c.red },
    NvimTreeGitDeletedIcon = { fg = c.red },
    NvimTreeGitDirty       = { fg = c.orange },
    NvimTreeGitDirtyIcon   = { fg = c.orange },
    NvimTreeGitNew         = { fg = c.green },
    NvimTreeImageFile      = { fg = c.purple },
    NvimTreeIndentMarker   = { fg = c.fg_dark3 },
    NvimTreeRootFolder     = { fg = c.orange, bold = true },
    NvimTreeSpecialFile    = { fg = c.yellow, underline = true },
    NvimTreeSymlink        = { fg = c.cyan },
  }
end

return M
