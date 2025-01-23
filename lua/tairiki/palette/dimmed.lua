local util  = require("tairiki.util")
---@type tairiki.Palette
local M     = {
	bg      = "#1d1f21",
	fg      = "#afb2b0",
	purple  = "#b19db8",
	green   = "#b3ba7e",
	orange  = "#d99667",
	blue    = "#93a8b8",
	yellow  = "#d9bf89",
	cyan    = "#9bb0ac",
	red     = "#c37d7c",
	comment = "#696969",
	x       = {
		operator = "#c5c8c6",
	},
	group_x = nil,
	-- todo part of larger palette registration but do this better
	none    = "none",
}

M.bg_light  = "#242627"
M.bg_light2 = "#323435"
M.bg_light3 = "#323435"
M.fg_dark   = "#959896"
M.fg_dark2  = "#858886"
M.fg_dark3  = "#858886"

function M.regen_sub_groups(self)
	self.diag     = {
		error = self.red,
		info  = self.cyan,
		warn  = self.orange,
		hint  = self.fg_dark3,
		ok    = self.green,
	}
	self.diff     = {
		add    = util.blend(self.green, self.bg, 0.3),
		remove = util.blend(self.red, self.bg, 0.1),
		change = util.blend(self.fg_dark3, self.bg, 0.3),
		text   = util.blend(self.blue, self.bg, 0.35),
	}
	self.syn      = {
		ident       = self.fg,
		constant    = self.red,
		literal     = self.orange,
		func        = self.blue,
		string      = self.green,
		type        = self.yellow,
		keyword     = self.purple,
		keyword_mod = self.red,
		special     = self.red,
		delim       = self.fg_dark3,
		exception   = self.red,
		operator    = self.x.operator,
	}

	self.terminal = {
		black         = util.lighten(self.bg_light3, 0.95),
		bright_black  = self.fg_dark3,
		red           = util.darken(self.red, 0.85),
		bright_red    = self.red,
		green         = util.darken(self.green, 0.85),
		bright_green  = self.green,
		yellow        = util.darken(self.yellow, 0.85),
		bright_yellow = self.yellow,
		blue          = util.darken(self.blue, 0.85),
		bright_blue   = self.blue,
		purple        = util.darken(self.purple, 0.85),
		bright_purple = self.purple,
		cyan          = util.darken(self.cyan, 0.85),
		bright_cyan   = self.cyan,
		white         = self.fg,
		bright_white  = util.lighten(self.fg, 0.85)
	}
end

M:regen_sub_groups()

return M
