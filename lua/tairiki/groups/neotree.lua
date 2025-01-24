local M = {}

---@param c tairiki.Palette
---@param opts tairiki.Config
---@return tairiki.Highlights
function M.get(c, opts)
	return {
		NeoTreeNormal             = { fg = c.fg, bg = opts.transparent and c.none or c.bg_light },
		NeoTreeNormalNC           = { fg = c.fg, bg = opts.transparent and c.none or c.bg_light },
		NeoTreeVertSplit          = { fg = c.bg_light, bg = opts.transparent and c.none or c.bg_light },
		NeoTreeWinSeparator       = { fg = c.bg_light, bg = opts.transparent and c.none or c.bg_light, },
		NeoTreeEndOfBuffer        = { fg = opts.end_of_buffer and c.bg_light2 or c.bg_light, bg = opts.transparent and c.none or c.bg_light, },
		NeoTreeCursorLine         = { bg = opts.transparent and c.none or c.bg_light2 },
		NeoTreeRootName           = { fg = c.orange, bold = true },
		NeoTreeGitAdded           = { fg = c.green },
		NeoTreeGitDeleted         = { fg = c.red },
		NeoTreeGitModified        = { fg = c.yellow },
		NeoTreeGitConflict        = { fg = c.red, bold = true, italic = true },
		NeoTreeGitUntracked       = { fg = c.red, italic = true },
		NeoTreeIndentMarker       = { fg = c.fg_dark3 },
		NeoTreeSymbolicLinkTarget = { fg = c.purple },
	}
end

return M
