local c = require('tairiki.colors')
local cfg = vim.g.tairiki_config
local util = require("tairiki.util")

local M = {}
local hl = {langs = {}, plugins = {}}

local function vim_highlights(highlights)
    for group_name, group_settings in pairs(highlights) do
		local settings = {
			fg = group_settings.fg or "none",
			bg = group_settings.bg or "none",
			sp = group_settings.sp or "none",
			link = group_settings.link or nil,
		}
		if group_settings.fmt and group_settings.fmt ~= "none" then
			for _, fmtopt in pairs(vim.split(group_settings.fmt, ',')) do
				settings[fmtopt] = 1
			end
		end
		vim.api.nvim_set_hl(0, group_name, settings)
    end
end

local colors = {
	Fg = {fg = c.fg},
	MidGrey = {fg = c.mid_grey},
	LightGrey = {fg = c.light_grey},
	LightOrange = { fg = c.light_orange},
	LightPurple = { fg = c.light_purple},
	LightRed = { fg = c.light_red},
	Grey = {fg = c.grey},
	Red = {fg = c.red},
	Cyan = {fg = c.cyan},
	Yellow = {fg = c.yellow},
	Orange = {fg = c.orange},
	Green = {fg = c.green},
	Blue = {fg = c.blue},
	Purple = {fg = c.purple}
}

hl.common = {
	Normal = {fg = c.fg, bg = cfg.transparent and c.none or c.bg0},
	Terminal = {fg = c.fg, bg = cfg.transparent and c.none or c.bg0},
	EndOfBuffer = {fg = cfg.ending_tildes and c.grey or c.bg0, bg = cfg.transparent and c.none or c.bg0},
	FoldColumn = {fg = c.light_grey, bg = cfg.transparent and c.none or c.bg1}, -- find where this is
	Folded = {fg = c.fg, bg = cfg.transparent and c.none or c.bg1}, -- find where this is
	SignColumn = {fg = c.fg, bg = cfg.transparent and c.none or c.bg0},
	ToolbarLine = {fg = c.fg},
	Cursor = {fmt = "reverse"},
	vCursor = {fmt = "reverse"},
	iCursor = {fmt = "reverse"},
	lCursor = {fmt = "reverse"},
	CursorIM = {fmt = "reverse"},
	CursorColumn = {bg = c.bg0},
	CursorLine = {bg = cfg.transparent and c.none or c.bg1},
	ColorColumn = {bg = c.bg2},
	CursorLineNr = {fg = c.light_grey, fmt="bold"},
	LineNr = colors.MidGrey,
	Conceal = {fg = c.comment},
	DiffAdd = {fg = c.diff_add},
	DiffChange = {fg = c.diff_change},
	DiffDelete = {fg = c.diff_delete},
	DiffText = {fg = c.diff_text},
	DiffAdded = colors.Green,
	DiffRemoved = colors.Red,
	DiffFile = colors.Cyan,
	DiffIndexLine = colors.Grey,
	Directory = {fg = c.blue},
	ErrorMsg = {fg = c.red, fmt = "bold"},
	WarningMsg = {fg = c.yellow, fmt = "bold"},
	MoreMsg = colors.Purple,
	CurSearch = {fg = c.bg0, bg = c.orange},
	IncSearch = {fg = c.bg0, bg = c.orange},
	Search = {bg = c.bg_d},
	Substitute = {fg = c.bg0, bg = c.orange},
	MatchParen = {fg = c.none, bg = c.light_grey},
	NonText = {fg = c.light_grey},
	--Whitespace = {fg = c.grey},
	SpecialKey = {fg = c.grey}, -- is blue in orig
	Pmenu = {fg = c.light_grey, bg = c.bg1},
	PmenuSbar = {fg = c.none, bg = c.bg1},
	PmenuSel = {fg = c.blue, bg = c.bg2},
	WildMenu = {fg = c.bg0, bg = c.orange},
	PmenuThumb = {bg = c.light_grey},
	Question = {fg = c.yellow},
	SpellBad = {fmt = "undercurl", sp = c.red},
	SpellCap = {fmt = "undercurl", sp = c.yellow},
	SpellLocal = {fmt = "undercurl", sp = c.blue},
	SpellRare = {fmt = "undercurl", sp = c.purple},
	StatusLine = {fg = c.mid_grey, bg = c.bg1},
	StatusLineTerm = {fg = c.mid_grey, bg = c.bg2},
	StatusLineNC = {fg = c.grey, bg = c.bg2},
	StatusLineTermNC = {fg = c.grey, bg = c.bg2},
	TabLine = {fg = c.comment, bg = c.bg0},
	TabLineFill = {bg = c.bg0},
	TabLineSel =  {fg = c.bg0, bg = c.comment},
	VertSplit = {fg = c.grey},
	WinSeparator = {fg = c.grey},
	Visual = {bg = c.bg3, fmt = "bold"},
	VisualNOS = {bg = c.bg3, fmt = "bold"},
	QuickFixLine = {fg = c.blue, fmt = "underline"},
	Debug = {fg = c.yellow},
	debugPC = {fg = c.bg0, bg = c.green},
	debugBreakpoint = {fg = c.bg0, bg = c.red},
	ToolbarButton = {fg = c.bg0, bg = c.bg_blue},
	FloatBorder = {fg = c.grey, bg = c.bg0},
	NormalFloat = {fg = c.fg, bg = c.bg0},
	healthSuccess = { fg = c.bg1, bg = "#00ff00"},
	helpHeader = colors.LightPurple,
}

hl.syntax = {
	String = {fg = c.green, fmt = cfg.code_style.strings},
	Character = colors.Green,
	Number = colors.LightOrange,
	Float = colors.LightOrange,
	Boolean = colors.LightOrange,
	Type = colors.Yellow,
	Structure = colors.Yellow,
	StorageClass = colors.Red,
	Identifier = {fg = c.red, fmt = cfg.code_style.variables},
	Constant = colors.Orange,
	PreProc = colors.Purple,
	PreCondit = colors.Purple,
	Include = colors.LightPurple,
	Keyword = {fg = c.purple, fmt = cfg.code_style.keywords},
	Define = colors.Purple,
	Typedef = colors.Yellow,
	Exception = colors.Red,
	Conditional = {fg = c.purple, fmt = cfg.code_style.keywords},
	Repeat = {fg = c.light_purple, fmt = cfg.code_style.keywords},
	Statement = colors.Green,
	Macro = colors.Orange,
	Error = colors.Red,
	Label = colors.Green,
	Special = colors.Red,
	SpecialChar = colors.Red,
	Function = {fg = c.blue, fmt = cfg.code_style.functions},
	Operator = colors.LightGrey,
	Title = { fg = c.light_grey, fmt = "bold" },
	Tag = colors.Red,
	Delimiter = colors.MidGrey,
	Comment = {fg = c.comment, fmt = cfg.code_style.comments},
	SpecialComment = {fg = c.comment, fmt = cfg.code_style.comments},
	Todo = {fg = c.Yellow, fmt = cfg.code_style.comments}
}
print(util.darken(c.cyan, 0.9, c.bg0))
hl.treesitter = {
	["@annotation"] = colors.Fg,
	["@attribute"] = colors.Cyan,
	["@boolean"] = colors.LightOrange,
	["@character"] = colors.Green,
	["@comment"] = {fg = c.comment, fmt = cfg.code_style.comments},
	["@conditional"] = {fg = c.purple, fmt = cfg.code_style.keywords},
	["@constant"] = {fg = c.orange, fmt = cfg.code_style.constants},
	["@constant.builtin"] = {fg = c.orange, fmt = cfg.code_style.constants},
	["@constant.macro"] = {fg = c.orange, fmt = cfg.code_style.constants},
	["@constructor"] = {fg = c.yellow},
	["@error"] = colors.Fg,
	["@exception"] = colors.Purple, -- maybe
	["@field"] = colors.Cyan,
	["@float"] = colors.LightOrange,
	["@function"] = {fg = c.blue, fmt = cfg.code_style.functions},
	["@function.builtin"] = {fg = c.red, fmt = cfg.code_style.functions},
	["@function.macro"] = {fg = c.light_orange, fmt = cfg.code_style.functions},
	["@include"] = colors.Purple,
	["@keyword"] = {fg = c.purple, fmt = cfg.code_style.keywords},
	["@keyword.function"] = {fg = c.light_purple, fmt = cfg.code_style.functions},
	["@keyword.operator"] =  {fg = c.light_purple, fmt = cfg.code_style.keywords},
	["@keyword.coroutine"] =  {fg = c.light_purple, fmt = cfg.code_style.keywords},
	["@keyword.return"] =  {fg = c.purple, fmt = cfg.code_style.keywords},
	["@label"] = colors.Blue,
	["@method"] = {fg = c.blue, fmt = cfg.code_style.functions},
	["@namespace"] = colors.Fg,
	["@none"] = {},
	["@number"] = colors.LightOrange,
	["@operator"] = colors.LightGrey,
	["@parameter"] = colors.Fg,
	["@parameter.reference"] = colors.Fg,
	["@preproc"] = colors.Purple,
	["@property"] = { link = "@field" },
	["@property.class"] = colors.Yellow, -- maybe is light_grey in orig, do specific color? linked to field
	["@property.id"] = colors.Red, -- maybe is light_grey in orig, do specific color? linked to field
	["@punctuation.delimiter"] = colors.Grey,
	["@punctuation.bracket"] = colors.Grey,
	["@punctuation.special"] = colors.Red,
	["@repeat"] = {fg = c.purple, fmt = cfg.code_style.keywords},
	["@string"] = {fg = c.green, fmt = cfg.code_style.strings},
	["@string.regex"] = {fg = c.orange, fmt = cfg.code_style.strings},
	["@string.escape"] = {fg = c.red, fmt = cfg.code_style.strings},
	["@symbol"] = colors.Cyan, -- maybe, linked to field
	["@tag"] = colors.Red,
	["@tag.attribute"] = colors.Orange,
	["@tag.delimiter"] = colors.MidGrey,
	["@text"] = colors.Fg,
	["@text.strong"] = {fg = c.orange, fmt = 'bold'},
	["@text.emphasis"] = {fg = c.orange, fmt = 'italic'},
	["@text.underline"] = {fg = c.fg, fmt = 'underline'},
	["@text.strike"] = {fg = c.fg, fmt = 'strikethrough'},
	["@text.title"] = {fg = c.red, fmt = 'bold'},
	["@text.title.1"] = {fg = c.red, fmt = 'bold'},
	["@text.title.1.marker"] = {fg = c.orange, fmt = 'bold'},
	["@text.title.2"] = {fg = c.yellow, fmt = 'bold'},
	["@text.title.2.marker"] = {fg = c.orange, fmt = 'bold'},
	["@text.title.3"] = {fg = c.green, fmt = 'bold'},
	["@text.title.3.marker"] = {fg = c.orange, fmt = 'bold'},
	["@text.title.4"] = {fg = c.cyan, fmt = 'bold'},
	["@text.title.4.marker"] = {fg = c.orange, fmt = 'bold'},
	["@text.title.5"] = {fg = c.blue, fmt = 'bold'},
	["@text.title.5.marker"] = {fg = c.orange, fmt = 'bold'},
	["@text.title.6"] = {fg = c.purple, fmt = 'bold'},
	["@text.title.6.marker"] = {fg = c.orange, fmt = 'bold'},
	["@text.literal"] = colors.Green,
	["@text.uri"] = {fg = c.cyan, fmt = 'underline'},
	["@text.todo"] = {fg = c.yellow, fmt = cfg.code_style.comments},
	["@text.math"] = colors.Orange,
	["@text.reference"] = colors.Green,
	["@text.environment"] = colors.Fg,
	["@text.environment.name"] = colors.Fg,
	["@text.diff.add"] = colors.Green,
	["@text.diff.delete"] = colors.Red,
	["@note"] = colors.Fg,
	["@warning"] = colors.Fg,
	["@danger"] = colors.Fg,
	["@type"] = colors.Yellow,
	["@type.builtin"] = colors.LightOrange,
	["@type.qualifier"] = colors.LightPurple,
	["@variable"] = {fg = c.fg, fmt = cfg.code_style.variables},
	["@variable.builtin"] = {fg = c.red, fmt = cfg.code_style.variables},
	["@variable.global"] = {fg = c.orange, fmt = cfg.code_style.variables},

	-- language specific

	-- html
	["@text.title.html"] = {fg = c.comment, fmt = 'bold'},

	-- latex
	["@function.latex"] = colors.Blue,

	-- markdown
	["@label.markdown"] = colors.Red,
	["@punctuation.delimiter.markdown_inline"] = colors.MidGrey,
	["@text.reference.markdown_inline"] = colors.Green,

	-- vim
	["@namespace.vim"] = colors.Orange,

	-- vimdoc
	["@label.vimdoc"] = colors.LightPurple,
	["@string.special.vimdoc"] = colors.LightOrange,

	-- css
	["@type.tag.css"] = colors.Orange,
	["@punctuation.bracket.css"] = colors.MidGrey,

	-- gitcommit
	["@keyword.gitcommit"] = colors.Blue,
	["@text.title.gitcommit"] = { fg = c.orange, fmt = "bold" },

	-- typescript
	["@attribute.typescript"] = colors.Blue,
}
hl.lsp = {
	["@lsp.type.comment"] = hl.treesitter[ "@comment"],
	["@lsp.type.enum"] = hl.treesitter["@type"],
	["@lsp.type.enumMember"] = hl.treesitter["@constant.builtin"],
	["@lsp.type.interface"] = hl.treesitter["@type"],
	["@lsp.type.typeParameter"] = hl.treesitter["@type"],
	["@lsp.type.keyword"] = hl.treesitter["@keyword"],
	["@lsp.type.namespace"] = hl.treesitter["@namespace"],
	["@lsp.type.parameter"] = hl.treesitter["@parameter"],
	["@lsp.type.property"] = hl.treesitter["@property"],
	["@lsp.type.variable"] = {}, -- use treesitter styles for regular variables
	["@lsp.type.macro"] = hl.treesitter["@function.macro"],
	["@lsp.type.method"] = hl.treesitter["@method"],
	["@lsp.type.number"] = hl.treesitter["@number"],
	["@lsp.type.generic"] = hl.treesitter["@text"],
	["@lsp.type.builtinType"] = hl.treesitter["@type.builtin"],
	["@lsp.typemod.method.defaultLibrary"] = hl.treesitter['@function'],
	["@lsp.typemod.function.defaultLibrary"] = colors.Red,
	["@lsp.typemod.operator.injected"] = hl.treesitter["@operator"],
	["@lsp.typemod.string.injected"] = hl.treesitter["@string"],
	["@lsp.typemod.variable.defaultLibrary"] = hl.treesitter["@variable.builtin"],
	["@lsp.typemod.variable.injected"] = hl.treesitter["@variable"],
	["@lsp.typemod.variable.static"] = hl.treesitter["@constant"],

	-- language specific

	-- lua
	["@lsp.typemod.variable.global.lua"] = hl.treesitter["@variable.global"],
}


-- maybe, these are same right now
local diagnostics_error_color = cfg.diagnostics.darker and c.dark_red or c.red
local diagnostics_hint_color = cfg.diagnostics.darker and c.dark_purple or c.purple
local diagnostics_warn_color = cfg.diagnostics.darker and c.dark_yellow or c.yellow
local diagnostics_info_color = cfg.diagnostics.darker and c.dark_cyan or c.cyan
hl.plugins.lsp = {
	LspCxxHlGroupEnumConstant = colors.Orange,
	LspCxxHlGroupMemberVariable = colors.Orange,
	LspCxxHlGroupNamespace = colors.Blue,
	LspCxxHlSkippedRegion = colors.Grey,
	LspCxxHlSkippedRegionBeginEnd = colors.Red,

	DiagnosticError = {fg = c.red},
	DiagnosticHint = {fg = c.purple},
	DiagnosticInfo = {fg = c.cyan},
	DiagnosticWarn = {fg = c.yellow},

	DiagnosticVirtualTextError = { bg = cfg.diagnostics.background and util.darken(diagnostics_error_color, 0.1, c.bg0) or c.none,
									fg = diagnostics_error_color },
	DiagnosticVirtualTextWarn = { bg = cfg.diagnostics.background and util.darken(diagnostics_warn_color, 0.1, c.bg0) or c.none,
									fg = diagnostics_warn_color },
	DiagnosticVirtualTextInfo = { bg = cfg.diagnostics.background and util.darken(diagnostics_info_color, 0.1, c.bg0) or c.none,
									fg = diagnostics_info_color },
	DiagnosticVirtualTextHint = { bg = cfg.diagnostics.background and util.darken(diagnostics_hint_color, 0.1, c.bg0) or c.none,
									fg = diagnostics_hint_color },

	DiagnosticUnderlineError = {fmt = cfg.diagnostics.undercurl and "undercurl" or "underline", sp = c.red},
	DiagnosticUnderlineHint = {fmt = cfg.diagnostics.undercurl and "undercurl" or "underline", sp = c.purple},
	DiagnosticUnderlineInfo = {fmt = cfg.diagnostics.undercurl and "undercurl" or "underline", sp = c.blue},
	DiagnosticUnderlineWarn = {fmt = cfg.diagnostics.undercurl and "undercurl" or "underline", sp = c.yellow},

	LspReferenceText = { bg = c.bg2 },
	LspReferenceWrite = { bg = c.bg2 },
	LspReferenceRead = { bg = c.bg2 },

	LspCodeLens = { fg = c.grey, fmt = cfg.code_style.comments },
	LspCodeLensSeparator = { fg = c.grey },
}

-- unchanged
hl.plugins.lsp.LspDiagnosticsDefaultError = hl.plugins.lsp.DiagnosticError
hl.plugins.lsp.LspDiagnosticsDefaultHint = hl.plugins.lsp.DiagnosticHint
hl.plugins.lsp.LspDiagnosticsDefaultInformation = hl.plugins.lsp.DiagnosticInfo
hl.plugins.lsp.LspDiagnosticsDefaultWarning = hl.plugins.lsp.DiagnosticWarn
hl.plugins.lsp.LspDiagnosticsUnderlineError = hl.plugins.lsp.DiagnosticUnderlineError
hl.plugins.lsp.LspDiagnosticsUnderlineHint = hl.plugins.lsp.DiagnosticUnderlineHint
hl.plugins.lsp.LspDiagnosticsUnderlineInformation = hl.plugins.lsp.DiagnosticUnderlineInfo
hl.plugins.lsp.LspDiagnosticsUnderlineWarning = hl.plugins.lsp.DiagnosticUnderlineWarn
hl.plugins.lsp.LspDiagnosticsVirtualTextError = hl.plugins.lsp.DiagnosticVirtualTextError
hl.plugins.lsp.LspDiagnosticsVirtualTextWarning = hl.plugins.lsp.DiagnosticVirtualTextWarn
hl.plugins.lsp.LspDiagnosticsVirtualTextInformation = hl.plugins.lsp.DiagnosticVirtualTextInfo
hl.plugins.lsp.LspDiagnosticsVirtualTextHint = hl.plugins.lsp.DiagnosticVirtualTextHint

-- j-hui/fidget.nvim
hl.plugins.fidget = {
	FidgetTitle = colors.Purple
}

-- unchanged
hl.plugins.ale = {
	ALEErrorSign = hl.plugins.lsp.DiagnosticError,
	ALEInfoSign = hl.plugins.lsp.DiagnosticInfo,
	ALEWarningSign = hl.plugins.lsp.DiagnosticWarn,
}

-- unchanged
hl.plugins.barbar = {
	BufferCurrent = { fmt = "bold" },
	BufferCurrentMod = { fg = c.orange, fmt = "bold,italic" },
	BufferCurrentSign = { fg = c.purple },
	BufferInactiveMod = { fg = c.light_grey, bg = c.bg1, fmt = "italic" },
	BufferVisible = { fg = c.light_grey, bg = c.bg0 },
	BufferVisibleMod = { fg = c.yellow, bg = c.bg0, fmt = "italic" },
	BufferVisibleIndex = { fg = c.light_grey, bg = c.bg0 },
	BufferVisibleSign = { fg = c.light_grey, bg = c.bg0 },
	BufferVisibleTarget = { fg = c.light_grey, bg = c.bg0 },
}

-- unchanged
hl.plugins.cmp = {
	CmpItemAbbr = colors.Fg,
	CmpItemAbbrDeprecated = { fg = c.light_grey, fmt = "strikethrough" },
	CmpItemAbbrMatch = colors.Cyan,
	CmpItemAbbrMatchFuzzy = { fg = c.cyan, fmt = "underline" },
	CmpItemMenu = colors.MidGrey,
	CmpItemKind = { fg = c.purple, fmt = cfg.cmp_itemkind_reverse and "reverse" },
}

-- unchanged
hl.plugins.coc = {
	CocErrorSign = hl.plugins.lsp.DiagnosticError,
	CocHintSign = hl.plugins.lsp.DiagnosticHint,
	CocInfoSign = hl.plugins.lsp.DiagnosticInfo,
	CocWarningSign = hl.plugins.lsp.DiagnosticWarn,
}

-- unchaged
hl.plugins.whichkey = {
	WhichKey = colors.Red,
	WhichKeyDesc = colors.Blue,
	WhichKeyGroup = colors.Orange,
	WhichKeySeparator = colors.Green
}

-- unchanged
hl.plugins.gitgutter = {
	GitGutterAdd = {fg = c.green},
	GitGutterChange = {fg = c.blue},
	GitGutterDelete = {fg = c.red},
}

-- unchanged
hl.plugins.hop = {
	HopNextKey = {fg = c.red, fmt = "bold"},
	HopNextKey1 = {fg = c.cyan, fmt = "bold"},
	HopNextKey2 = {fg = util.darken(c.blue, 0.7)},
	HopUnmatched = colors.Grey,
}

-- unchanged
hl.plugins.diffview = {
	DiffviewFilePanelTitle = {fg = c.blue, fmt = "bold"},
	DiffviewFilePanelCounter = {fg = c.purple, fmt = "bold"},
	DiffviewFilePanelFileName = colors.Fg,
	DiffviewNormal = hl.common.Normal,
	DiffviewCursorLine = hl.common.CursorLine,
	DiffviewVertSplit = hl.common.VertSplit,
	DiffviewSignColumn = hl.common.SignColumn,
	DiffviewStatusLine = hl.common.StatusLine,
	DiffviewStatusLineNC = hl.common.StatusLineNC,
	DiffviewEndOfBuffer = hl.common.EndOfBuffer,
	DiffviewFilePanelRootPath = colors.Grey,
	DiffviewFilePanelPath = colors.Grey,
	DiffviewFilePanelInsertions = colors.Green,
	DiffviewFilePanelDeletions = colors.Red,
	DiffviewStatusAdded = colors.Green,
	DiffviewStatusUntracked = colors.Blue,
	DiffviewStatusModified = colors.Blue,
	DiffviewStatusRenamed = colors.Blue,
	DiffviewStatusCopied = colors.Blue,
	DiffviewStatusTypeChange = colors.Blue,
	DiffviewStatusUnmerged = colors.Blue,
	DiffviewStatusUnknown = colors.Red,
	DiffviewStatusDeleted = colors.Red,
	DiffviewStatusBroken = colors.Red
}

-- tpope/vim-fugitive
hl.plugins.fugitive = {
	fugitiveHeader = colors.MidGrey,
	fugitiveSection = colors.LightGrey,
	fugitiveUntrackedSection = { link = "fugitiveSection" },
	fugitiveUnstagedSection = { link = "fugitiveSection" },
	fugitiveStagedSection = { link = "fugitiveSection" },
	fugitiveHeading = colors.Purple,
	fugitiveUnstagedHeading = { link = "fugitiveHeading" },
	fugitiveUntrackedHeading = { link = "fugitiveHeading" },
	fugitiveStagedHeading = { link = "fugitiveHeading" },
	fugitiveUntrackedModifier = colors.Red,
	fugitiveUnstagedModifier = colors.Orange,
	fugitiveStagedModifier = colors.Orange,
	fugitiveSymbolicRef = { fg = c.green },
	fugitiveHash = { fg = util.darken(util.blend(c.yellow, c.bg0, 0.9), 0.9) },
	fugitiveHelpTag = colors.Blue,
}

hl.plugins.gitsigns = {
	GitSignsAdd = colors.Green,
	GitSignsAddLn = colors.Green,
	GitSignsAddNr = colors.Green,
	GitSignsChange = colors.Cyan,
	GitSignsChangeLn = colors.Cyan,
	GitSignsChangeNr = colors.Cyan,
	GitSignsDelete = colors.Red,
	GitSignsDeleteLn = colors.Red,
	GitSignsDeleteNr = colors.Red
}


-- unchanged
hl.plugins.neo_tree = {
	NeoTreeNormal = { fg = c.fg, bg = cfg.transparent and c.none or c.bg_d },
	NeoTreeNormalNC = { fg = c.fg, bg = cfg.transparent and c.none or c.bg_d },
	NeoTreeVertSplit = { fg = c.bg1, bg = cfg.transparent and c.none or c.bg1 },
	NeoTreeWinSeparator = { fg = c.bg1, bg = cfg.transparent and c.none or c.bg1 },
	NeoTreeEndOfBuffer = { fg = cfg.ending_tildes and c.bg2 or c.bg_d, bg = cfg.transparent and c.none or c.bg_d },
	NeoTreeRootName = { fg = c.orange, fmt = "bold" },
	NeoTreeGitAdded = colors.Green,
	NeoTreeGitDeleted = colors.Red,
	NeoTreeGitModified = colors.Yellow,
	NeoTreeGitConflict = { fg = c.red, fmt = "bold,italic" },
	NeoTreeGitUntracked = { fg = c.red, fmt = "italic" },
	NeoTreeIndentMarker = colors.Grey,
	NeoTreeSymbolicLinkTarget = colors.Purple,
}

-- unchanged
hl.plugins.neotest = {
	NeotestAdapterName = { fg = c.purple, fmt = "bold" },
	NeotestDir = colors.Cyan,
	NeotestExpandMarker = colors.Grey,
	NeotestFailed = colors.Red,
	NeotestFile = colors.Cyan,
	NeotestFocused = { fmt = "bold,italic" },
	NeotestIndent = colors.Grey,
	NeotestMarked = { fg = c.orange, fmt = "bold" },
	NeotestNamespace = colors.Blue,
	NeotestPassed = colors.Green,
	NeotestRunning = colors.Yellow,
	NeotestWinSelect = { fg = c.cyan, fmt = "bold" },
	NeotestSkipped = colors.MidGrey,
	NeotestTarget = colors.Purple,
	NeotestTest = colors.Fg,
	NeotestUnknown = colors.MidGrey,
}

hl.plugins.netrw = {
	netrwExe = colors.Green,
	netreDirectory = colors.Blue,
	netrwSymLink = colors.Cyan,
}

-- unchanged
hl.plugins.nvim_tree = {
	NvimTreeNormal = { fg = c.fg, bg = cfg.transparent and c.none or c.bg_d },
	NvimTreeVertSplit = { fg = c.bg_d, bg = cfg.transparent and c.none or c.bg_d },
	NvimTreeEndOfBuffer = { fg = cfg.ending_tildes and c.bg2 or c.bg_d, bg = cfg.transparent and c.none or c.bg_d },
	NvimTreeRootFolder = { fg = c.orange, fmt = "bold" },
	NvimTreeGitDirty = colors.Yellow,
	NvimTreeGitNew = colors.Green,
	NvimTreeGitDeleted = colors.Red,
	NvimTreeSpecialFile = { fg = c.yellow, fmt = "underline" },
	NvimTreeIndentMarker = colors.Fg,
	NvimTreeImageFile = { fg = c.dark_purple },
	NvimTreeSymlink = colors.Purple,
	NvimTreeFolderName = colors.Blue,
}

hl.plugins.telescope = {
	TelescopeBorder = colors.Grey,
	TelescopeMatching = { fg = c.light_cyan },
	TelescopePromptPrefix = colors.Grey,
	TelescopeSelection =  { fg = c.fg, bg = c.bg2, fmt = "bold" },
	TelescopeSelectionCaret = { fg = c.light_orange, bg = c.bg1 },
	TelescopeMultiSelection = { fg = c.light_orange },
	TelescopeMultiIcon = { fg = c.red },
	TelescopeTitle = { fg = c.orange }
}

-- unchanged
hl.plugins.dashboard = {
	DashboardShortCut = colors.Blue,
	DashboardHeader = colors.Yellow,
	DashboardCenter = colors.Cyan,
	DashboardFooter = { fg = c.dark_red, fmt = "italic"}
}

-- unchanged
hl.plugins.outline = {
	FocusedSymbol = { fg = c.purple, bg = c.bg2, fmt = "bold" },
	AerialLine = { fg = c.purple, bg = c.bg2, fmt = "bold" },
}

-- unchanged
hl.plugins.navic = {
	NavicText = { fg = c.fg },
	NavicSeparator = { fg = c.light_grey },
}

-- unchanged
hl.plugins.ts_rainbow = {
	rainbowcol1 = colors.MidGrey,
	rainbowcol2 = colors.Yellow,
	rainbowcol3 = colors.Blue,
	rainbowcol4 = colors.Orange,
	rainbowcol5 = colors.Purple,
	rainbowcol6 = colors.Green,
	rainbowcol7 = colors.Red
}

-- unchanged
hl.plugins.ts_rainbow2 = {
	TSRainbowRed = colors.Red,
	TSRainbowYellow = colors.Yellow,
	TSRainbowBlue = colors.Blue,
	TSRainbowOrange = colors.Orange,
	TSRainbowGreen = colors.Green,
	TSRainbowViolet = colors.Purple,
	TSRainbowCyan = colors.Cyan,
}

-- unchanged
hl.plugins.rainbow_delimiters = {
	RainbowDelimiterRed = colors.Red,
	RainbowDelimiterYellow = colors.Yellow,
	RainbowDelimiterBlue = colors.Blue,
	RainbowDelimiterOrange = colors.Orange,
	RainbowDelimiterGreen = colors.Green,
	RainbowDelimiterViolet = colors.Purple,
	RainbowDelimiterCyan = colors.Cyan,
}

-- unchanged
hl.plugins.indent_blankline = {
	IndentBlanklineIndent1 = colors.Blue,
	IndentBlanklineIndent2 = colors.Green,
	IndentBlanklineIndent3 = colors.Cyan,
	IndentBlanklineIndent4 = colors.MidGrey,
	IndentBlanklineIndent5 = colors.Purple,
	IndentBlanklineIndent6 = colors.Red,
	IndentBlanklineChar = { fg = c.bg1, fmt = "nocombine" },
	IndentBlanklineContextChar = { fg = c.grey, fmt = "nocombine" },
	IndentBlanklineContextStart = { sp = c.grey, fmt = "underline" },
	IndentBlanklineContextSpaceChar = { fmt = "nocombine" },
}

-- unchanged
hl.plugins.mini = {
	MiniCompletionActiveParameter = { fmt = "underline" },

	MiniCursorword = { fmt = "underline" },
	MiniCursorwordCurrent = { fmt = "underline" },

	MiniIndentscopeSymbol = { fg = c.grey },
	MiniIndentscopePrefix = { fmt = "nocombine" }, -- Make it invisible

	MiniJump = { fg = c.purple, fmt = "underline", sp = c.purple },

	MiniJump2dSpot = { fg = c.red, fmt = "bold,nocombine" },

	MiniStarterCurrent = { fmt = "nocombine" },
	MiniStarterFooter = { fg = c.dark_red, fmt = "italic" },
	MiniStarterHeader = colors.Yellow,
	MiniStarterInactive = { fg = c.grey, fmt = cfg.code_style.comments },
	MiniStarterItem = { fg = c.fg, bg = cfg.transparent and c.none or c.bg0 },
	MiniStarterItemBullet = { fg = c.grey },
	MiniStarterItemPrefix = { fg = c.yellow },
	MiniStarterSection = colors.MidGrey,
	MiniStarterQuery = { fg = c.cyan },

	MiniStatuslineDevinfo = { fg = c.fg, bg = c.bg2 },
	MiniStatuslineFileinfo = { fg = c.fg, bg = c.bg2 },
	MiniStatuslineFilename = { fg = c.grey, bg = c.bg1 },
	MiniStatuslineInactive = { fg = c.grey, bg = c.bg0 },
	MiniStatuslineModeCommand = { fg = c.bg0, bg = c.yellow, fmt = "bold" },
	MiniStatuslineModeInsert = { fg = c.bg0, bg = c.blue, fmt = "bold" },
	MiniStatuslineModeNormal = { fg = c.bg0, bg = c.green, fmt = "bold" },
	MiniStatuslineModeOther = { fg = c.bg0, bg = c.cyan, fmt = "bold" },
	MiniStatuslineModeReplace = { fg = c.bg0, bg = c.red, fmt = "bold" },
	MiniStatuslineModeVisual = { fg = c.bg0, bg = c.purple, fmt = "bold" },

	MiniSurround = { fg = c.bg0, bg = c.orange },

	MiniTablineCurrent = { fmt = "bold" },
	MiniTablineFill = { fg = c.grey, bg = c.bg1 },
	MiniTablineHidden = { fg = c.fg, bg = c.bg1 },
	MiniTablineModifiedCurrent = { fg = c.orange, fmt = "bold,italic" },
	MiniTablineModifiedHidden = { fg = c.light_grey, bg = c.bg1, fmt = "italic" },
	MiniTablineModifiedVisible = { fg = c.yellow, bg = c.bg0, fmt = "italic" },
	MiniTablineTabpagesection = { fg = c.bg0, bg = c.bg_yellow },
	MiniTablineVisible = { fg = c.light_grey, bg = c.bg0 },

	MiniTestEmphasis = { fmt = "bold" },
	MiniTestFail = { fg = c.red, fmt = "bold" },
	MiniTestPass = { fg = c.green, fmt = "bold" },

	MiniTrailspace = { bg = c.red },
}

-- unchanged
hl.langs.c = {
	cInclude = colors.Blue,
	cStorageClass = colors.Purple,
	cTypedef = colors.Purple,
	cDefine = colors.Cyan,
	cTSInclude = colors.Blue,
	cTSConstant = colors.Cyan,
	cTSConstMacro = colors.Purple,
	cTSOperator = colors.Purple,
}

-- unchanged
hl.langs.cpp = {
	cppStatement = { fg = c.purple, fmt = "bold" },
	cppTSInclude = colors.Blue,
	cppTSConstant = colors.Cyan,
	cppTSConstMacro = colors.Purple,
	cppTSOperator = colors.Purple,
}

-- unchanged
hl.langs.markdown = {
	markdownBlockquote = colors.Grey,
	markdownBold = {fg = c.none, fmt = "bold"},
	markdownBoldDelimiter = colors.Grey,
	markdownCode = colors.Green,
	markdownCodeBlock = colors.Green,
	markdownCodeDelimiter = colors.Yellow,
	markdownH1 = {fg = c.red, fmt = "bold"},
	markdownH2 = {fg = c.purple, fmt = "bold"},
	markdownH3 = {fg = c.orange, fmt = "bold"},
	markdownH4 = {fg = c.red, fmt = "bold"},
	markdownH5 = {fg = c.purple, fmt = "bold"},
	markdownH6 = {fg = c.orange, fmt = "bold"},
	markdownHeadingDelimiter = colors.Grey,
	markdownHeadingRule = colors.Grey,
	markdownId = colors.Yellow,
	markdownIdDeclaration = colors.Red,
	markdownItalic = {fg = c.none, fmt = "italic"},
	markdownItalicDelimiter = {fg = c.grey, fmt = "italic"},
	markdownLinkDelimiter = colors.Grey,
	markdownLinkText = colors.Red,
	markdownLinkTextDelimiter = colors.Grey,
	markdownListMarker = colors.Red,
	markdownOrderedListMarker = colors.Red,
	markdownRule = colors.Purple,
	markdownUrl = {fg = c.blue, fmt = "underline"},
	markdownUrlDelimiter = colors.Grey,
	markdownUrlTitleDelimiter = colors.Green
}

-- unchanged
hl.langs.php = {
	phpFunctions = {fg = c.fg, fmt = cfg.code_style.functions},
	phpMethods = colors.Cyan,
	phpStructure = colors.Purple,
	phpOperator = colors.Purple,
	phpMemberSelector = colors.Fg,
	phpVarSelector = {fg = c.orange, fmt = cfg.code_style.variables},
	phpIdentifier = {fg = c.orange, fmt = cfg.code_style.variables},
	phpBoolean = colors.Cyan,
	phpNumber = colors.Orange,
	phpHereDoc = colors.Green,
	phpNowDoc = colors.Green,
	phpSCKeyword = {fg = c.purple, fmt = cfg.code_style.keywords},
	phpFCKeyword = {fg = c.purple, fmt = cfg.code_style.keywords},
	phpRegion = colors.Blue
}

-- unchanged
hl.langs.scala = {
	scalaNameDefinition = colors.Fg,
	scalaInterpolationBoundary = colors.Purple,
	scalaInterpolation = colors.Purple,
	scalaTypeOperator = colors.Red,
	scalaOperator = colors.Red,
	scalaKeywordModifier = {fg = c.red, fmt = cfg.code_style.keywords},
}

-- unchanged
hl.langs.tex = {
	latexTSInclude = colors.Blue,
	latexTSFuncMacro = {fg = c.fg, fmt = cfg.code_style.functions},
	latexTSEnvironment = { fg = c.cyan, fmt = "bold" },
	latexTSEnvironmentName = colors.Yellow,
	texCmdEnv = colors.Cyan,
	texEnvArgName = colors.Yellow,
	latexTSTitle = colors.Green,
	latexTSType = colors.Blue,
	latexTSMath   = colors.Orange,
	texMathZoneX  = colors.Orange,
	texMathZoneXX = colors.Orange,
	texMathDelimZone = colors.MidGrey,
	texMathDelim = colors.Purple,
	texMathOper = colors.Red,
	texCmd = colors.Purple,
	texCmdPart = colors.Blue,
	texCmdPackage = colors.Blue,
	texPgfType = colors.Yellow,
}

-- unchanged
hl.langs.vim = {
	vimOption = colors.Red,
	vimSetEqual = colors.Yellow,
	vimMap = colors.Purple,
	vimMapModKey = colors.Orange,
	vimNotation = colors.Red,
	vimMapLhs = colors.Fg,
	vimMapRhs = colors.Blue,
	vimCommentTitle = {fg = c.light_grey, fmt = cfg.code_style.comments},
	vimFuncKey = colors.Purple,
	vimFuncVar = colors.Red,
	vimOper = colors.MidGrey,
	vimOperParen = { link = "vimOper" },
	vimFunction = colors.Blue,
	vimCommand = colors.Purple,
	vimIsCommand = colors.Orange,
	vimLet = colors.Red,
	vimSubst = colors.Yellow,
	vimVar = { fg = c.fg, fmt = cfg.code_style.variables },
}

-- unchanged
local lsp_kind_icons_color = {
	Default = c.purple,
	Array = c.yellow,
	Boolean = c.orange,
	Class = c.yellow,
	Color = c.green,
	Constant = c.orange,
	Constructor = c.blue,
	Enum = c.purple,
	EnumMember = c.yellow,
	Event = c.yellow,
	Field = c.purple,
	File = c.blue,
	Folder = c.orange,
	Function = c.blue,
	Interface = c.green,
	Key = c.cyan,
	Keyword = c.cyan,
	Method = c.blue,
	Module = c.orange,
	Namespace = c.red,
	Null = c.grey,
	Number = c.orange,
	Object = c.red,
	Operator = c.red,
	Package = c.yellow,
	Property = c.cyan,
	Reference = c.orange,
	Snippet = c.red,
	String = c.green,
	Struct = c.purple,
	Text = c.light_grey,
	TypeParameter = c.red,
	Unit = c.green,
	Value = c.orange,
	Variable = c.purple,
}

function M.setup()
	-- define cmp and aerial kind highlights with lsp_kind_icons_color
	for kind, color in pairs(lsp_kind_icons_color) do
		hl.plugins.cmp["CmpItemKind" .. kind] = { fg = color, fmt = cfg.cmp_itemkind_reverse and "reverse" }
		hl.plugins.outline["Aerial" .. kind .. "Icon"] = { fg = color }
		hl.plugins.navic["NavicIcons" .. kind] = { fg = color }
	end

	vim_highlights(hl.common)
	vim_highlights(hl.syntax)
	vim_highlights(hl.treesitter)
	if hl.lsp then
		vim_highlights(hl.lsp)
	end
	for _, group in pairs(hl.langs) do vim_highlights(group) end
	for _, group in pairs(hl.plugins) do vim_highlights(group) end

	-- user defined highlights: vim_highlights function cannot be used because it sets an attribute to none if not specified
	local function replace_color(prefix, color_name)
		if not color_name then return "" end
		if color_name:sub(1, 1) == '$' then
			local name = color_name:sub(2, -1)
			color_name = c[name]
			if not color_name then
				vim.schedule(function()
					vim.notify('tairiki.nvim: unknown color "' .. name .. '"', vim.log.levels.ERROR, { title = "tairiki.nvim" })
				end)
				return ""
			end
		end
		return prefix .. "=" .. color_name
	end

	for group_name, group_settings in pairs(vim.g.tairiki_config.highlights) do
		if group_settings.link then
			vim.api.nvim_command(
				string.format("highlight! link %s %s", group_name, group_settings.link)
			)
		else
			vim.api.nvim_command(string.format("highlight %s %s %s %s %s", group_name,
				replace_color("guifg", group_settings.fg),
				replace_color("guibg", group_settings.bg),
				replace_color("guisp", group_settings.sp),
				replace_color("gui", group_settings.fmt)))
		end
	end
end

return M

