local util  = require("tairiki.util")
---@type tairiki.Palette
local M     = {
	bg = "#ffffff",
	fg = "#001070",
	purple = "#7929c8",
	green = "#008000",
	orange = "#df5926",
	blue = "#0070c1",
	yellow = "#7c5c20",
	cyan = "#1e797f",
	red = "#a31515",
	comment = "#cd0009",
	diag = nil,
	syn = nil,
	diff = nil,
	x = {
		light_orange = "#c72e0f",
		light_purple = "#693988",
	},
	none = "none",
}

M.bg_light  = "#f0f0f8"
M.bg_light2 = "#e8e8e0"
M.bg_light3 = "#d8d8d0"
M.fg_dark   = "#202020"
M.fg_dark2  = "#000000"
M.fg_dark3  = "#000000"

M.diag      = {
	error = M.red,
	info  = M.cyan,
	warn  = M.yellow,
	hint  = M.purple,
	ok    = M.green,
}
M.diff      = {
	add    = util.blend(M.green, M.bg, 0.15),
	remove = util.blend(M.red, M.bg, 0.1),
	change = M.bg_light2,
	text   = util.blend(M.blue, M.bg, 0.15),
}
M.syn       = {
	ident       = M.fg,
	constant    = M.orange,
	literal     = M.x.light_orange,
	func        = M.blue,
	string      = M.green,
	type        = M.yellow,
	keyword     = M.purple,
	keyword_mod = M.x.light_purple,
	special     = M.red,
	delim       = M.fg_dark3,
	exception   = M.red,
	operator    = M.fg_dark,
}

function M.group_x(self)
	return {
		["@attribute.builtin"]       = { fg = self.red },
		["@attribute.typescript"]    = { fg = self.blue },
		["@constructor"]             = { fg = self.yellow },
		["@function.macro"]          = "Macro",
		["@keyword.coroutine"]       = { fg = self.syn.keyword_mod },
		["@keyword.exception"]       = { fg = self.syn.exception },
		["@keyword.function"]        = { fg = self.syn.keyword_mod },
		["@keyword.operator"]        = { fg = self.syn.keyword_mod },
		["@markup.italic"]           = { fg = self.x.light_orange, italic = true },
		["@markup.strong"]           = { fg = self.x.light_orange, bold = true },
		["@markup.link.url"]         = { fg = self.blue },
		["@markup.list"]             = "Special",
		["@markup.math"]             = { fg = self.blue },
		["@markup.quote"]            = { fg = self.fg_dark2 },
		["@markup.raw.block"]        = { fg = self.fg_dark2 },
		["@module"]                  = { fg = "#b1bdc4" }, -- TODO util
		["@string.escape"]           = { fg = self.red },
		["@string.regexp"]           = { fg = self.orange },
		["@string.special.url"]      = { fg = self.blue, underline = true },
		["@string.special.vimdoc"]   = { fg = self.x.light_orange },
		["@tag"]                     = { fg = self.red },
		["@tag.attribute"]           = { fg = self.orange },
		["@tag.builtin"]             = "Special",
		["@tag.delimiter"]           = { fg = self.fg_dark2 },
		["@type.builtin"]            = { fg = self.x.light_orange },
		["@type.tag.css"]            = { fg = self.orange },

		["@label.markdown"]          = "Tag",
		["@label.vimdoc"]            = { fg = self.x.light_purple },
		["@keyword.gitcommit"]       = { fg = self.blue },
		["@namespace.vim"]           = { fg = self.orange },
		["@punctuation.bracket.css"] = { fg = self.fg_dark2 },

		-- todo diag darkening in real groups
		-- shouldnt be here
		FloatBorder                  = { fg = self.fg_dark3, bg = self.bg_light },
		FloatTitle                   = "Title",
		FoldColumn                   = { fg = self.fg_dark, bg = self.bg_light },
		Identifier                   = { fg = self.red },
		Ignore                       = "Normal",
		Include                      = { fg = self.purple },
		Label                        = { fg = self.x.light_orange },
		SpecialKey                   = { fg = self.fg_dark3 },
		Statement                    = { fg = self.green },
		StatusLine                   = { fg = self.fg_dark2, bg = self.bg_light },
		StatusLineNC                 = { fg = self.fg_dark3, bg = self.bg_light2 },
		StatusLineTerm               = { fg = self.fg_dark2, bg = self.bg_light2 },
		StatusLineTermNC             = { fg = self.fg_dark3, bg = self.bg_light2 },
		StorageClass                 = { fg = self.red },
	}
end

return M
