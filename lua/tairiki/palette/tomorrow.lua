-- A palette that more closely mirrors the original
-- https://github.com/chriskempson/vim-tomorrow-theme
local util = require("tairiki.util")
-- stylua: ignore start
local M     = {
  bg       = "#1d1f21",
  fg       = "#c5c8c6",
  purple   = "#b294bb",
  green    = "#b5bd68",
  orange   = "#de935f",
  blue     = "#81a2be",
  yellow   = "#f0c674",
  cyan     = "#8abeb7",
  red      = "#cc6666",
  comment  = "#969896",
  none     = "none",
}

M.bg_light  = "#282a2e"
M.bg_light2 = "#323435"
M.bg_light3 = "#373b41"
M.bg_light4 = "#494e56"
M.fg_dark   = "#afb2b0"
M.fg_dark2  = "#969896"
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
    constant    = self.orange,
    literal     = self.orange,
    func        = self.blue,
    string      = self.green,
    type        = self.blue,
    keyword     = self.purple,
    keyword_mod = self.purple,
    special     = self.fg,
    delim       = self.fg_dark,
    exception   = self.red,
    operator    = self.cyan,
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

-- todo this should probably be a function
M.highlights = {
	LineNr     = { fg = M.bg_light3 },
	NonText    = { fg = M.bg_light3 },
	SpecialKey = { fg = M.bg_light3 },
	ModeMsg    = { fg = M.green },
	MoreMsg    = { fg = M.green },
	Question   = { fg = M.green },
	WarningMsg = { fg = M.red, bold = false },
	MatchParen = { bg = M.bg_light3 },
	Folded     = { fg = M.comment, bg = M.bg },
	FoldColumn = { bg = M.bg },
	PMenu      = { fg = M.fg, bg = M.bg_light3 },
	PMenuSel   = { fg = M.fg, bg = M.bg_light3, reverse = true },
	DiffAdd    = { fg = M.green, bg = M.bg_light4 },
	DiffDelete = { fg = M.red, bg = M.bg_light4},
	DiffChange = { fg = M.yellow, bg = M.bg_light4},
	DiffText   = { fg = M.bg_light4, bg = M.orange},

	Comment          = { fg = M.comment },
	Todo             = { fg = M.comment, bg = M.bg },
	Title            = { fg = M.comment },
	Statement        = { fg = M.fg, bold = false },
	Structure        = { fg = M.purple },
	Special          = { fg = M.fg }, -- wack!?
	Operator         = { fg = M.cyan },
	Include          = { fg = M.blue },
	Tag              = { fg = M.red },
	["@tag.builtin"] = { fg = M.red },
	["@function.builtin"] = { fg = M.orange },

	TelescopeMatching = { fg = M.orange },
}
-- stylua: ignore end


M:regen_sub_groups()

return M
