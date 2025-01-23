local M = {}

---@param c tairiki.Palette
---@param opts tairiki.Config
---@return tairiki.Highlights
function M.get(c, opts)
	return {
		OilChange    = { fg = c.yellow },
		OilHidden    = { fg = c.fg_dark3 },
		OilCopy      = { fg = c.green },
		OilDirHidden = "OilDir",
	}
end

return M
