local M = {}

---@param c tairiki.Palette
---@param opts tairiki.Config
---@return tairiki.Highlights
function M.get(c, opts)
	return {
		GitGutterAdd    = { fg = c.green },
		GitGutterChange = { fg = c.cyan },
		GitGutterDelete = { fg = c.red },
	}
end

return M
