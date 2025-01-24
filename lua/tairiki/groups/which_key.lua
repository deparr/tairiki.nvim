local M = {}

---@param c tairiki.Palette
---@param opts tairiki.Config
---@return tairiki.Highlights
function M.get(c, opts)
	return {
		WhichKey           = { fg = c.red },
		WhichKeyDesc       = { fg = c.purple },
		WhichKeyGroup      = { fg = c.orange },
		WhichKeySeparator  = { fg = c.green },
		WhichKeyIconAzure  = { fg = c.cyan },
		WhichKeyIconBlue   = { fg = c.blue },
		WhichKeyIconCyan   = { fg = c.cyan },
		WhichKeyIconGreen  = { fg = c.green },
		WhichKeyIconGrey   = { fg = c.fg_dark2 },
		WhichKeyIconOrange = { fg = c.orange },
		WhichKeyIconPurple = { fg = c.purple },
		WhichKeyIconRed    = { fg = c.red },
		WhichKeyIconYellow = { fg = c.yellow },
	}
end

return M
