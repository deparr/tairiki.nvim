local util = require "tairiki.util"
local M = {}

-- realname > modname
M.plugins = {
	["diffview.nvim"]   = "diffview",
	["gitsigns.nvim"]   = "gitsigns",
	["neovim"]          = "neovim",
	["nvim-cmp"]        = "cmp",
	["oil.nvim"]        = "oil",
	["semantic-tokens"] = "semantic_tokens",
	["telescope.nvim"]  = "telescope",
	["treesitter"]      = "treesitter",
	["vim-fugitive"]    = "fugitive",
}

function M.flatten_styles(groups)
	for _, hl in pairs(groups) do
		if type(hl.style) == "table" then
			for s, v in pairs(hl.style) do
				hl[s] = v
			end
			hl.style = nil
		end
	end
end

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
			if package.loaded.lazy then
				local names = vim.tbl_keys(require("lazy.core.config").plugins)
				for _, plugin in ipairs(names) do
					if M.plugins[plugin] then
						groups[M.plugins[plugin]] = true
					end
				end
			else
				vim.notify("tairiki.nvim: unable to load lazy.nvim for plugin autodetect", vim.log.levels.ERROR)
			end
		end

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
	for group, enabled in pairs(groups) do
		if enabled then
			-- local ok, groupmod = pcall(require, "tairiki.groups." .. group)
			local groupmod = util.load_mod("tairiki.groups." .. group)
			for g, hl in pairs(groupmod.get(colors, opts)) do
				ret[g] = hl
			end
		end
	end

	if colors.highlights then
		ret = vim.tbl_extend("force", ret, colors.highlights)
	end

	if opts.highlights then
		opts.highlights(ret, colors, opts)
	end

	M.flatten_styles(ret)

	return ret
end

return M
