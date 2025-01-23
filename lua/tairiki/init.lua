local config = require("tairiki.config")

local M = {}

M.palette = {}

M.setup = config.setup

function M.load(opts)
	opts = config.extend(opts)
	local palette_bg_style = require("tairiki.palette").get_palette_bg_style(opts.palette)

	if vim.o.background ~= palette_bg_style then
		-- if background doesn't match and we're already on this palette, swap background
		if vim.g.colors_name == "tairiki-" .. opts.palette then
			-- use user defined default palettes
			opts.palette = vim.o.background == "light" and (M.palette.light or opts.default_light) or (M.palette.dark or opts.default_dark)
			-- opts.palette = vim.o.background == "light" and "light" or "dark"
		else
			-- otherwise we should swap background to our palette's style
			vim.o.background = palette_bg_style
		end
	end
	M.palette[vim.o.background] = opts.palette

	require("tairiki.theme").load(opts)
end

return M
