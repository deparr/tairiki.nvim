local M = {}

---@param c tairiki.Palette
---@param opts tairiki.Config
---@return tairiki.Highlights
function M.get(c, opts)
	return {
		BufferCurrent       = { bold = true },
		BufferCurrentMod    = { fg = c.orange, bold = true, italic = true },
		BufferCurrentSign   = { fg = c.purple },
		BufferInactiveMod   = { fg = c.fg_dark, bg = c.bg_light, italic = true },
		BufferVisible       = { fg = c.fg_dark, bg = c.bg },
		BufferVisibleMod    = { fg = c.yellow, bg = c.bg, italic = true },
		BufferVisibleIndex  = { fg = c.fg_dark, bg = c.bg },
		BufferVisibleSign   = { fg = c.fg_dark, bg = c.bg },
		BufferVisibleTarget = { fg = c.fg_dark, bg = c.bg },
	}
end

return M
