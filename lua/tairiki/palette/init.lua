local util = require("tairiki.util")
local M = {
	---@type table<string, tairiki.Palette>
	palettes = {},
}

---@class tairiki.Palette
---@field bg string
---@field fg string
---@field bg_light? string
---@field bg_light2? string
---@field bg_light3? string
---@field fg_dark? string
---@field fg_dark2? string
---@field fg_dark3? string
---@field purple string
---@field green string
---@field orange string
---@field blue string
---@field yellow string
---@field cyan string
---@field red string
---@field comment string
---@field none string
---@field syn tairiki.Palette.Syntax
---@field diag? tairiki.Palette.Diagnostic
---@field diff? tairiki.Palette.Diff
---@field terminal? table<string, string>
---@field highlights? table<string, string|tairiki.Highlight>
---@field regen_sub_groups fun(self: tairiki.Palette)

---@class tairiki.Palette.Diagnostic
---@field error? string
---@field info? string
---@field warn? string
---@field hint? string
---@field ok? string

---@class tairiki.Palette.Diff
---@field add? string
---@field remove? string
---@field change? string
---@field text? string

---@class tairiki.Palette.Syntax
---@field ident? string
---@field constant? string
---@field literal? string
---@field func? string
---@field string? string
---@field type? string
---@field keyword? string
---@field keyword_mod? string
---@field special? string
---@field delim? string
---@field exception? string
---@field operator? string

function M.gen_fg_bg_colors(c)
	if not c.bg_light then c.bg_light = util.lighten(c.bg, 0.9, c.fg) end
	if not c.bg_light2 then c.bg_light2 = util.lighten(c.bg_light, 0.9, c.fg) end
	if not c.bg_light3 then c.bg_light3 = util.lighten(c.bg_light2, 0.9, c.fg) end

	if not c.fg_dark then c.fg_dark = util.darken(c.fg, 0.9, c.bg) end
	if not c.fg_dark2 then c.fg_dark2 = util.darken(c.fg_dark1, 0.9, c.bg) end
	if not c.fg_dark2 then c.fg_dark3 = util.darken(c.fg_dark2, 0.9, c.bg) end
end

function M.gen_diag_colors(c)
	c.diag = {
		ok = c.green,
		info = c.cyan,
		hint = c.purple,
		warn = c.yellow,
		error = c.red
	}
end

function M.gen_diff_colors(c)
	c.diff = {
		add = util.blend(M.green, M.bg, 0.3),
		remove = util.blend(M.red, M.bg, 0.1),
		change = util.blend(M.fg_dark3, M.bg, 0.3),
		text = util.blend(M.blue, M.bg, 0.35),
	}
end

function M.gen_term_colors(p)
	p.terminal = {
		black         = util.lighten(p.bg_light3, 0.95),
		bright_black  = p.fg_dark3,
		red           = util.darken(p.red, 0.85),
		bright_red    = p.red,
		green         = util.darken(p.green, 0.85),
		bright_green  = p.green,
		yellow        = util.darken(p.yellow, 0.85),
		bright_yellow = p.yellow,
		blue          = util.darken(p.blue, 0.85),
		bright_blue   = p.blue,
		purple        = util.darken(p.purple, 0.85),
		bright_purple = p.purple,
		cyan          = util.darken(p.cyan, 0.85),
		bright_cyan   = p.cyan,
		white         = p.fg,
		bright_white  = util.lighten(p.fg, 0.85)
	}
end

---@param name string name to regiter palette as
---@param colors tairiki.Palette palette to register
function M.register(name, colors)
	M.gen_fg_bg_colors(colors)

	if not colors.diag then
		M.gen_diag_colors(colors)
	end

	if not colors.diff then
		M.gen_diff_colors(colors)
	end

	if not colors.terminal then
		M.gen_term_colors(colors)
	end

	M.palettes[name] = colors
end

---@param which string
---@param opts tairiki.Config?
function M.load(which, opts)
	local p = M.palettes[which]
	if p == nil then
		vim.notify(("tairiki.nvim: invalid palette '%s', defaulting to dark"):format(which))
		p = M.palettes.dark
	end
	if opts and opts.colors then
		opts.colors(p, opts)
		if p.regen_sub_groups then
			p:regen_sub_groups()
		end
	end
	return p
end

function M.get_palette_bg_style(which)
	local p = M.palettes[which]
	local avg = util.rgb(p.bg)
	return ((avg[1] + avg[2] + avg[3]) / 3) > 0xe0 and "light" or "dark"
end

M.palettes.dark = require("tairiki.palette.dark")
M.palettes.light = require("tairiki.palette.light")
M.palettes.dimmed = require("tairiki.palette.dimmed")
M.palettes.light_legacy = require("tairiki.palette.light_legacy")

return M
