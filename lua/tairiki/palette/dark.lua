local util = require("tairiki.util")
---@type tairiki.Palette
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
	diag = nil,
	syn = nil,
	diff = nil,
	-- todo dont like this way of extra colors, but also want it to be typed
	x = {
		light_orange = "#e78c45",
		light_purple = "#c397d8",
		dark_cyan    = "#70c0b1",
		dark_red     = "#d54e53",
		dark_yellow  = "#e7c547",
	},
	none = "none",
}


M.bg_light  = "#1d1f21"
M.bg_light2 = "#282828"
M.bg_light3 = "#3b3f4c"
M.fg_dark   = "#afb2b0"
M.fg_dark2  = "#969896"
M.fg_dark3  = "#696969"

M.diag      = {
	error = M.red,
	info  = M.cyan,
	warn  = M.yellow,
	hint  = M.purple,
	ok    = M.green,
}
M.diff      = {
	add    = util.blend(M.green, M.bg, 0.3),
	remove = util.blend(M.red, M.bg, 0.1),
	change = util.blend(M.fg_dark3, M.bg, 0.3),
	text   = util.blend(M.blue, M.bg, 0.4),
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

-- todo not sure about this way of doing overrides
---@param self tairiki.Palette
function M.group_x(self)
	return {
		-- treesitter
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

		-- todo diag
		-- neovim
		DiagnosticVirtualTextError   = { fg = self.x.dark_red, bg = "#281b1b" },
		DiagnosticVirtualTextHint    = { fg = self.x.light_purple, bg = "#262229" },
		DiagnosticVirtualTextInfo    = { fg = self.x.dark_cyan, bg = "#1e2625" },
		DiagnosticVirtualTextOk      = { fg = util.darken(self.green, 0.9, self.bg), bg = "#23241d" },
		DiagnosticVirtualTextWarn    = { fg = self.x.dark_yellow, bg = "#2a271a" },
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
