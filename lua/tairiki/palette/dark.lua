local util = require("tairiki.util")
---@class tairiki.Palette
local M = {
	bg = "#151515",
	fg = "#c5c8c6",
	purple = "#b294bb",
	green = "#b5bd68",
	orange = "#de935f",
	blue = "#81a2be",
	yellow = "#f0c674",
	cyan = "#7eada7",
	red = "#cc6666",
	comment = "#a89984",
	none = "none",

	light_orange = "#e78c45",
	light_purple = "#c397d8",
}


M.bg_light  = "#1d1f21"
M.bg_light2 = "#282828"
M.bg_light3 = "#3b3f4c"
M.fg_dark   = "#afb2b0"
M.fg_dark2  = "#969896"
M.fg_dark3  = "#696969"

function M.regen_sub_groups(self)
	self.diag       = {
		error = self.red,
		info  = self.cyan,
		warn  = self.yellow,
		hint  = self.purple,
		ok    = self.green,
	}
	self.diff       = {
		add    = util.blend(self.green, self.bg, 0.3),
		remove = util.blend(self.red, self.bg, 0.1),
		change = util.blend(self.fg_dark3, self.bg, 0.3),
		text   = util.blend(self.blue, self.bg, 0.4),
	}
	self.syn        = {
		ident       = self.fg,
		constant    = self.orange,
		literal     = self.light_orange,
		func        = self.blue,
		string      = self.green,
		type        = self.yellow,
		keyword     = self.purple,
		keyword_mod = self.light_purple,
		special     = self.red,
		delim       = self.fg_dark3,
		exception   = self.red,
		operator    = self.fg_dark,
	}

	self.terminal   = {
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

	self.highlights = {
		-- treesitter
		["@attribute.builtin"]       = { fg = self.red },
		["@attribute.typescript"]    = { fg = self.blue },
		["@constructor"]             = { fg = self.yellow },
		["@function.macro"]          = "Macro",
		["@keyword.coroutine"]       = { fg = self.syn.keyword_mod },
		["@keyword.exception"]       = { fg = self.syn.exception },
		["@keyword.function"]        = { fg = self.syn.keyword_mod },
		["@keyword.operator"]        = { fg = self.syn.keyword_mod },
		["@markup.italic"]           = { fg = self.light_orange, italic = true },
		["@markup.strong"]           = { fg = self.light_orange, bold = true },
		["@markup.link.url"]         = { fg = self.blue },
		["@markup.list"]             = "Special",
		["@markup.math"]             = { fg = self.blue },
		["@markup.quote"]            = { fg = self.fg_dark2 },
		["@markup.raw.block"]        = { fg = self.fg_dark2 },
		["@module"]                  = { fg = "#b1bdc4" }, -- TODO util
		["@string.escape"]           = { fg = self.red },
		["@string.regexp"]           = { fg = self.orange },
		["@string.special.url"]      = { fg = self.blue, underline = true },
		["@string.special.vimdoc"]   = { fg = self.light_orange },
		["@tag"]                     = { fg = self.red },
		["@tag.attribute"]           = { fg = self.orange },
		["@tag.builtin"]             = "Special",
		["@tag.delimiter"]           = { fg = self.fg_dark2 },
		["@type.builtin"]            = { fg = self.light_orange },
		["@type.tag.css"]            = { fg = self.orange },

		["@label.markdown"]          = "Tag",
		["@label.vimdoc"]            = { fg = self.light_purple },
		["@keyword.gitcommit"]       = { fg = self.blue },
		["@namespace.vim"]           = { fg = self.orange },
		["@punctuation.bracket.css"] = { fg = self.fg_dark2 },

		FloatBorder                  = { fg = self.fg_dark3, bg = self.bg_light },
		FloatTitle                   = "Title",
		FoldColumn                   = { fg = self.fg_dark, bg = self.bg_light },
		Identifier                   = { fg = self.red },
		Ignore                       = "Normal",
		Include                      = { fg = self.purple },
		Label                        = { fg = self.light_orange },
		SpecialKey                   = { fg = self.fg_dark3 },
		Statement                    = { fg = self.green },
		StatusLine                   = { fg = self.fg_dark2, bg = self.bg_light },
		StatusLineNC                 = { fg = self.fg_dark3, bg = self.bg_light2 },
		StatusLineTerm               = { fg = self.fg_dark2, bg = self.bg_light2 },
		StatusLineTermNC             = { fg = self.fg_dark3, bg = self.bg_light2 },
		StorageClass                 = { fg = self.red },
	}
end

M:regen_sub_groups()

return M
