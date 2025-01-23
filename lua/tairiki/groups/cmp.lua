local M = {}

---@param c tairiki.Palette
---@param opts tairiki.Config
---@return tairiki.Highlights
function M.get(c, opts)
	return {
		-- CmpItemAbbr = { fg = c.fg },
		-- CmpItemAbbrDeprecated = { fg = c.fg_dark, strikethrough = true },
		-- CmpItemAbbrMatch = { fg = c.cyan },
		-- CmpItemAbbrMatchFuzzy = { fg = c.cyan, underline = true},
		-- CmpItemMenu = { fg = c.fg_dark2 },
		-- CmpItemKind = {
		-- 	fg = c.purple,
		-- 	reverse = opts.cmp_itemkind_reverse,
		-- },
	}
end

return M
