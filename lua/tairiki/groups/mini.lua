local M = {}

---@param c tairiki.Palette
---@param opts tairiki.Config
---@return tairiki.Highlights
function M.get(c, opts)
	return {
		-- TODO how to deal with mini.nvim
		-- MiniCompletionActiveParameter = { fmt = "underline" },
		--
		-- MiniCursorword = { fmt = "underline" },
		-- MiniCursorwordCurrent = { fmt = "underline" },
		--
		-- MiniIndentscopeSymbol = { fg = c.grey },
		-- MiniIndentscopePrefix = { fmt = "nocombine" }, -- Make it invisible
		--
		-- MiniJump = { fg = c.purple, fmt = "underline", sp = c.purple },
		--
		-- MiniJump2dSpot = { fg = c.red, fmt = "bold,nocombine" },
		--
		-- MiniStarterCurrent = { fmt = "nocombine" },
		-- MiniStarterFooter = { fg = c.dark_red, fmt = "italic" },
		-- MiniStarterHeader = { fg = c.yellow },
		-- MiniStarterInactive = { fg = c.grey, fmt = cfg.code_style.comments },
		-- MiniStarterItem = { fg = c.fg, bg = cfg.transparent and c.none or c.bg0 },
		-- MiniStarterItemBullet = { fg = c.grey },
		-- MiniStarterItemPrefix = { fg = c.yellow },
		-- MiniStarterSection = { fg = c.mid_grey },
		-- MiniStarterQuery = { fg = c.cyan },
		--
		-- MiniStatuslineDevinfo = { fg = c.fg, bg = c.bg2 },
		-- MiniStatuslineFileinfo = { fg = c.fg, bg = c.bg2 },
		-- MiniStatuslineFilename = { fg = c.grey, bg = c.bg1 },
		-- MiniStatuslineInactive = { fg = c.grey, bg = c.bg0 },
		-- MiniStatuslineModeCommand = { fg = c.bg0, bg = c.yellow, fmt = "bold" },
		-- MiniStatuslineModeInsert = { fg = c.bg0, bg = c.blue, fmt = "bold" },
		-- MiniStatuslineModeNormal = { fg = c.bg0, bg = c.green, fmt = "bold" },
		-- MiniStatuslineModeOther = { fg = c.bg0, bg = c.cyan, fmt = "bold" },
		-- MiniStatuslineModeReplace = { fg = c.bg0, bg = c.red, fmt = "bold" },
		-- MiniStatuslineModeVisual = { fg = c.bg0, bg = c.purple, fmt = "bold" },
		--
		-- MiniSurround = { fg = c.bg0, bg = c.orange },
		--
		-- MiniTablineCurrent = { fmt = "bold" },
		-- MiniTablineFill = { fg = c.grey, bg = c.bg1 },
		-- MiniTablineHidden = { fg = c.fg, bg = c.bg1 },
		-- MiniTablineModifiedCurrent = { fg = c.orange, fmt = "bold,italic" },
		-- MiniTablineModifiedHidden = {
		--   fg = c.light_grey,
		--   bg = c.bg1,
		--   fmt = "italic",
		-- },
		-- MiniTablineModifiedVisible = { fg = c.yellow, bg = c.bg0, fmt = "italic" },
		-- MiniTablineTabpageSection = { fg = c.bg0, bg = c.yellow },
		-- MiniTablineVisible = { fg = c.light_grey, bg = c.bg0 },
		--
		-- MiniTestEmphasis = { fmt = "bold" },
		-- MiniTestFail = { fg = c.red, fmt = "bold" },
		-- MiniTestPass = { fg = c.green, fmt = "bold" },
		--
		-- MiniTrailspace = { bg = c.red },
	}
end

return M
