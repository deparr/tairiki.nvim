local M = {}

local group_names = {
	"neovim",
	"semantic-tokens",
	"treesitter",
}

function M.load(colors, opts)
	local h = function(group, hl)
		if type(hl) == "string" then
			vim.api.nvim_set_hl(0, group, { link = hl })
			return
		end
		vim.api.nvim_set_hl(0, group, hl)
	end

	for _, cat_name in ipairs(group_names) do
		local require_path = "tairiki.groups." .. cat_name
		local ok, cat = pcall(require, "tairiki.groups." .. cat_name)
		if ok then
			for group, hl in pairs(cat.get(colors, opts)) do
				h(group, hl)
			end
		end
	end
end

return M
