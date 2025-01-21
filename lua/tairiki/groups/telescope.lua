local M = {}

-- see :help treesitter-highlight-groups for group info

---@param c tairiki.Palette
---@return table<string, vim.api.keyset.highlight>
function M.get(c, opts)
	local ret = {
		-- TelescopeBorder = { fg = c.fg_dark3 },
		-- TelescopeMatching = { fg = c.orange },
		-- TelescopePromptPrefix = { fg = c.fg_dark3 },
		-- TelescopeSelection = { fg = c.fg, bg = c.bg_light2, bold = true },
		-- TelescopeSelectionCaret = { fg = c.syn.literal, bg = c.bg_light2 },
		TelescopeMultiSelection = { fg = c.syn.literal },
		-- TelescopeMultiIcon = { fg = c.red },
		TelescopeTitle = { fg = c.orange },
	}
	return ret
end

return M
