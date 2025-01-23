local M = {}

---@param c tairiki.Palette
---@param opts tairiki.Config
---@return tairiki.Highlights
function M.get(c, opts)
	return {
		GitSignsAdd      = { fg = c.green },
		GitSignsAddLn    = { fg = c.green },
		GitSignsAddNr    = { fg = c.green },
		GitSignsChange   = { fg = c.cyan },
		GitSignsChangeLn = { fg = c.cyan },
		GitSignsChangeNr = { fg = c.cyan },
		GitSignsDelete   = { fg = c.red },
		GitSignsDeleteLn = { fg = c.red },
		GitSignsDeleteNr = { fg = c.red },
	}
end

return M
