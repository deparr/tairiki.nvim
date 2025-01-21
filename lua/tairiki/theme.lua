local M = {}

---@param opts tairiki.Config
function M.load(opts)
	local palette = require("tairiki.palette").load(opts.palette)
	local groups = require("tairiki.groups").load(opts, palette)


	if vim.g.colors_name then
		vim.cmd "hi clear"
	end

	vim.o.termguicolors = true
	vim.g.colors_name = "tairiki-" .. opts.palette

	for group, hl in pairs(groups) do
		hl = type(hl) == "string" and { link = hl } or hl
		vim.api.nvim_set_hl(0, group, hl)
	end
end

return M
