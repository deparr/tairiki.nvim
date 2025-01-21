local M = {}

-- realname > modname
M.plugins = {
	["neovim"]          = "neovim",
	["semantic-tokens"] = "semantic_tokens",
	["telescope.nvim"]  = "telescope",
	["treesitter"]      = "treesitter",
}

function M.load(opts, colors)
	local groups = {
		neovim = true
	}

	if not opts.plugins.none then
		if opts.plugins.all then
			for _, module in pairs(M.plugins) do
				groups[module] = true
			end
		elseif opts.plugins.auto then
			vim.notify("tairiki: todo plugin auto discovery")
		end

		-- and then manual
		for plugin, module in pairs(M.plugins) do
			local cfg = opts.plugins[plugin]
			cfg = cfg == nil and opts.plugins[module] or cfg
			if cfg ~= nil then
				if type(cfg) == "table" then
					cfg = cfg.enabled
				end
				groups[module] = cfg or nil
			end
		end
	end

	local ret = {}
	-- todo gotta be a better way to do this
	for group, enabled in pairs(groups) do
		if enabled then
			local ok, groupmod = pcall(require, "tairiki.groups." .. group)
			if not ok then
				vim.notify("tairiki: error loading group `" .. group)
			end
			for g, hl in pairs(groupmod.get(colors, opts)) do
				ret[g] = hl
			end
		end
	end

	ret = vim.tbl_extend("force", ret, colors.group_x and colors:group_x() or {})

	return ret
end

return M
