local c = require("tairiki.colors")
local cfg = vim.g.tairiki_config
local util = require("tairiki.util")

local M = {}
local hl = { langs = {}, plugins = {} }

local function vim_highlights(highlights)
  for group_name, group_settings in pairs(highlights) do
    local settings = {
      fg = group_settings.fg or "none",
      bg = group_settings.bg or "none",
      sp = group_settings.sp or "none",
      link = group_settings.link or nil,
    }
    if group_settings.fmt and group_settings.fmt ~= "none" then
      for _, fmtopt in pairs(vim.split(group_settings.fmt, ",")) do
        settings[fmtopt] = 1
      end
    end
    vim.api.nvim_set_hl(0, group_name, settings)
  end
end

hl.common = {
  Normal = { fg = c.fg, bg = cfg.transparent and c.none or c.bg0 },
  Terminal = { fg = c.fg, bg = cfg.transparent and c.none or c.bg0 },
  EndOfBuffer = {
    fg = cfg.ending_tildes and c.grey or c.bg0,
    bg = cfg.transparent and c.none or c.bg0,
  },
  FoldColumn = { fg = c.light_grey, bg = cfg.transparent and c.none or c.bg1 },
  Folded = { fg = c.fg, bg = cfg.transparent and c.none or c.bg1 },
  SignColumn = { fg = c.fg, bg = cfg.transparent and c.none or c.bg0 },
  ToolbarLine = { fg = c.fg },
  Cursor = { fmt = "reverse" },
  vCursor = { fmt = "reverse" },
  iCursor = { fmt = "reverse" },
  lCursor = { fmt = "reverse" },
  CursorIM = { fmt = "reverse" },
  CursorColumn = { bg = c.bg0 },
  CursorLine = { bg = cfg.transparent and c.none or c.bg1 },
  ColorColumn = { bg = c.bg2 },
  CursorLineNr = { fg = c.light_grey, fmt = "bold" },
  LineNr = { fg = c.mid_grey },
  Conceal = { fg = c.comment },
  DiffAdd = { fg = c.diff_add },
  DiffChange = { fg = c.diff_change },
  DiffDelete = { fg = c.diff_delete },
  DiffText = { fg = c.diff_text },
  DiffAdded = { fg = c.green },
  DiffRemoved = { fg = c.red },
  DiffFile = { fg = c.cyan },
  DiffIndexLine = { fg = c.grey },
  Directory = { fg = c.blue },
  ErrorMsg = { fg = c.red, fmt = "bold" },
  WarningMsg = { fg = c.yellow, fmt = "bold" },
  MoreMsg = { fg = c.purple },
  CurSearch = { fg = c.bg0, bg = c.orange },
  IncSearch = { fg = c.bg0, bg = c.orange },
  Search = { fg = c.bg0, bg = c.yellow },
  Substitute = { fg = c.bg0, bg = c.orange },
  MatchParen = { fg = c.light_orange },
  NonText = { fg = c.light_grey },
  --Whitespace = {fg = c.grey}, -- this is for listchars I think?
  SpecialKey = { fg = c.grey }, -- is blue in orig
  Pmenu = { fg = c.light_grey, bg = c.bg1 },
  PmenuSbar = { fg = c.none, bg = c.bg1 },
  PmenuSel = { fg = c.blue, bg = c.bg2 },
  WildMenu = { fg = c.bg0, bg = c.orange },
  PmenuThumb = { bg = c.light_grey },
  Question = { fg = c.yellow },
  SpellBad = { fmt = "undercurl", sp = c.red },
  SpellCap = { fmt = "undercurl", sp = c.yellow },
  SpellLocal = { fmt = "undercurl", sp = c.blue },
  SpellRare = { fmt = "undercurl", sp = c.purple },
  StatusLine = { fg = c.mid_grey, bg = c.bg1 },
  StatusLineTerm = { fg = c.mid_grey, bg = c.bg2 },
  StatusLineNC = { fg = c.grey, bg = c.bg2 },
  StatusLineTermNC = { fg = c.grey, bg = c.bg2 },
  TabLine = { fg = c.comment, bg = c.bg0 },
  TabLineFill = { bg = c.bg0 },
  TabLineSel = { fg = c.bg0, bg = c.comment },
  VertSplit = { fg = c.grey },
  WinSeparator = { fg = c.grey },
  Visual = { bg = c.bg3, fmt = cfg.visual_bold and "bold" or nil },
  VisualNOS = { bg = c.bg3, fmt = cfg.visual_bold and "bold" or nil },
  QuickFixLine = { fg = c.blue, fmt = "underline" },
  Debug = { fg = c.yellow },
  debugPC = { fg = c.bg0, bg = c.green },
  debugBreakpoint = { fg = c.bg0, bg = c.red },
  ToolbarButton = { fg = c.bg0, bg = c.blue },
  FloatBorder = { fg = c.grey, bg = c.bg0 },
  NormalFloat = { fg = c.fg, bg = c.bg0 },
  healthSuccess = { fg = c.bg1, bg = "#00ff00" },
  helpHeader = { fg = c.light_purple },
}

hl.syntax = {
  String = { fg = c.green, fmt = cfg.code_style.strings },
  Character = { fg = c.green },
  Number = { fg = c.light_orange },
  Float = { fg = c.light_orange },
  Boolean = { fg = c.light_orange },
  Type = { fg = c.yellow },
  Structure = { fg = c.yellow },
  StorageClass = { fg = c.red },
  Identifier = { fg = c.red, fmt = cfg.code_style.variables },
  Constant = { fg = c.orange },
  PreProc = { fg = c.purple },
  PreCondit = { fg = c.purple },
  Include = { fg = c.light_purple },
  Keyword = { fg = c.purple, fmt = cfg.code_style.keywords },
  Define = { fg = c.purple },
  Typedef = { fg = c.yellow },
  Exception = { fg = c.red },
  Conditional = { fg = c.purple, fmt = cfg.code_style.keywords },
  Repeat = { fg = c.light_purple, fmt = cfg.code_style.keywords },
  Statement = { fg = c.green },
  Macro = { fg = c.orange },
  Error = { fg = c.red },
  Label = { fg = c.light_orange },
  Special = { fg = c.red, fmt = "bold" },
  SpecialChar = { fg = c.red },
  Function = { fg = c.blue, fmt = cfg.code_style.functions },
  Operator = { fg = c.light_grey },
  Title = { fg = c.fg, fmt = "bold" },
  Tag = { fg = c.red },
  Delimiter = { fg = c.mid_grey },
  Comment = { fg = c.comment, fmt = cfg.code_style.comments },
  SpecialComment = { fg = c.comment, fmt = cfg.code_style.comments },
  Todo = { fg = c.yellow, fmt = "bold" },
}

hl.treesitter = {
  ["@annotation"] = { fg = c.fg },
  ["@attribute"] = { fg = c.cyan },
  ["@boolean"] = { fg = c.light_orange },
  ["@character"] = { fg = c.green },
  ["@comment"] = { fg = c.comment, fmt = cfg.code_style.comments },
  ["@conditional"] = { fg = c.purple, fmt = cfg.code_style.keywords },
  ["@constant"] = { fg = c.orange, fmt = cfg.code_style.constants },
  ["@constant.builtin"] = { fg = c.orange, fmt = cfg.code_style.constants },
  ["@constant.macro"] = { fg = c.orange, fmt = cfg.code_style.constants },
  ["@constructor"] = { fg = c.yellow },
  ["@error"] = { fg = c.red },
  ["@exception"] = { fg = c.purple }, -- maybe
  ["@field"] = { fg = c.cyan },
  ["@float"] = { fg = c.light_orange },
  ["@function"] = { fg = c.blue, fmt = cfg.code_style.functions },
  ["@function.builtin"] = { fg = c.red, fmt = cfg.code_style.functions },
  ["@function.macro"] = {
    fg = c.light_orange,
    fmt = cfg.code_style.functions,
  },
  ["@include"] = { fg = c.purple },
  ["@keyword"] = { fg = c.purple, fmt = cfg.code_style.keywords },
  ["@keyword.function"] = {
    fg = c.light_purple,
    fmt = cfg.code_style.functions,
  },
  ["@keyword.operator"] = {
    fg = c.light_purple,
    fmt = cfg.code_style.keywords,
  },
  ["@keyword.coroutine"] = {
    fg = c.light_purple,
    fmt = cfg.code_style.keywords,
  },
  ["@keyword.return"] = { fg = c.purple, fmt = cfg.code_style.keywords },
  ["@label"] = { fg = c.blue },
  ["@method"] = { fg = c.blue, fmt = cfg.code_style.functions },
  ["@namespace"] = { fg = c.fg },
  ["@none"] = {},
  ["@number"] = { fg = c.light_orange },
  ["@operator"] = { fg = c.light_grey },
  ["@parameter"] = { fg = c.fg },
  ["@parameter.reference"] = { fg = c.fg },
  ["@preproc"] = { fg = c.purple },
  ["@property"] = { link = "@field" },
  ["@property.class"] = { fg = c.yellow }, -- maybe is light_grey in orig, do specific color? linked to field
  ["@property.id"] = { fg = c.red }, -- maybe is light_grey in orig, do specific color? linked to field
  ["@punctuation.delimiter"] = { fg = c.grey },
  ["@punctuation.bracket"] = { fg = c.grey },
  ["@punctuation.special"] = { fg = c.red },
  ["@repeat"] = { fg = c.purple, fmt = cfg.code_style.keywords },
  ["@string"] = { fg = c.green, fmt = cfg.code_style.strings },
  ["@string.regex"] = { fg = c.orange, fmt = cfg.code_style.strings },
  ["@string.escape"] = { fg = c.red, fmt = cfg.code_style.strings },
  ["@symbol"] = { fg = c.cyan }, -- maybe, linked to field
  ["@tag"] = { fg = c.red },
  ["@tag.attribute"] = { fg = c.orange },
  ["@tag.delimiter"] = { fg = c.mid_grey },
  ["@text"] = { fg = c.fg },
  ["@text.strong"] = { fg = c.orange, fmt = "bold" },
  ["@text.emphasis"] = { fg = c.orange, fmt = "italic" },
  ["@text.underline"] = { fg = c.fg, fmt = "underline" },
  ["@text.strike"] = { fg = c.fg, fmt = "strikethrough" },
  ["@text.title"] = { fg = c.red, fmt = "bold" },
  ["@text.title.1"] = { fg = c.red, fmt = "bold" },
  ["@text.title.1.marker"] = { fg = c.orange, fmt = "bold" },
  ["@text.title.2"] = { fg = c.yellow, fmt = "bold" },
  ["@text.title.2.marker"] = { fg = c.orange, fmt = "bold" },
  ["@text.title.3"] = { fg = c.green, fmt = "bold" },
  ["@text.title.3.marker"] = { fg = c.orange, fmt = "bold" },
  ["@text.title.4"] = { fg = c.cyan, fmt = "bold" },
  ["@text.title.4.marker"] = { fg = c.orange, fmt = "bold" },
  ["@text.title.5"] = { fg = c.blue, fmt = "bold" },
  ["@text.title.5.marker"] = { fg = c.orange, fmt = "bold" },
  ["@text.title.6"] = { fg = c.purple, fmt = "bold" },
  ["@text.title.6.marker"] = { fg = c.orange, fmt = "bold" },
  ["@text.literal"] = { fg = c.green },
  ["@text.uri"] = { fg = c.cyan, fmt = "underline" },
  ["@text.note"] = { link = "@note" },
  ["@text.warning"] = { link = "@warning" },
  ["@text.danger"] = { link = "@danger" },
  ["@text.todo"] = { link = "Todo" },
  ["@text.math"] = { fg = c.orange },
  ["@text.reference"] = { fg = c.green },
  ["@text.environment"] = { fg = c.fg },
  ["@text.environment.name"] = { fg = c.fg },
  ["@note"] = { fg = c.blue, fmt = "bold" },
  ["@warning"] = { fg = c.orange, fmt = "bold" },
  ["@danger"] = { fg = c.red, fmt = "bold" },
  ["@type"] = { fg = c.yellow },
  ["@type.builtin"] = { fg = c.light_orange },
  ["@type.qualifier"] = { fg = c.light_purple },
  ["@variable"] = { fg = c.fg, fmt = cfg.code_style.variables },
  ["@variable.builtin"] = { fg = c.red, fmt = cfg.code_style.variables },
  ["@variable.global"] = { fg = c.orange, fmt = cfg.code_style.variables },

  ["@diff.plus"] = { link = "DiffAdd" },
  ["@diff.minus"] = { link = "DiffDelete" },
  ["@diff.delta"] = { link = "DiffChange" },

  -- language specific

  -- html
  ["@text.title.html"] = { fg = c.comment, fmt = "bold" },

  -- latex
  ["@function.latex"] = { fg = c.blue },

  -- markdown
  ["@markup.heading.marker"] = { fg = c.orange, fmt = "bold" },
  ["@markup.heading.1.marker"] = { link = "@markup.heading.marker" },
  ["@markup.heading.2.marker"] = { link = "@markup.heading.marker" },
  ["@markup.heading.3.marker"] = { link = "@markup.heading.marker" },
  ["@markup.heading.4.marker"] = { link = "@markup.heading.marker" },
  ["@markup.heading.5.marker"] = { link = "@markup.heading.marker" },
  ["@markup.heading.6.marker"] = { link = "@markup.heading.marker" },
  ["@markup.heading"] = { link = "Title" },
  ["@markup.list"] = { link = "Special" },
  ["@markup.link.label"] = { fg = c.orange },
  ["@markup.strong"] = { fg = c.fg, fmt = "bold" },
  ["@markup.italic"] = { fg = c.fg, fmt = "italic" },
  ["@markup.strikethrough"] = { fg = c.fg, fmt = "strikethrough" },
  ["@markup.underline"] = { fg = c.fg, fmt = "underline" },
  ["@markup.strong.markdown_inline"] = { fg = c.light_orange, fmt = "bold" }, -- not sure here
  ["@markup.italic.markdown_inline"] = { fg = c.light_orange, fmt = "italic" },
  ["@markup.strikethrough.markdown_inline"] = { fmt = "strikethrough" },
  ["@conceal.markdown_inline"] = { fg = c.light_grey },

  ["@markup.raw"] = { fg = c.green },
  ["@markup.raw.delimiter"] = { fg = c.grey },
  ["@string.special.url"] = { fg = c.blue, fmt = "underline" },
  ["@markup.link.url"] = { fg = c.blue, fmt = "underline" },
  ["@label.markdown"] = { link = "Tag" },
  ["@markup.list.checked"] = { fg = c.diff_add, fmt = "bold" },
  ["@markup.list.unchecked"] = { fg = c.grey, fmt = "bold" },
  ["@markup.math"] = { fg = c.blue },
  ["@markup.link"] = { fg = c.blue },
  ["@markup.environment"] = { fg = c.cyan, fmt = "bold" },
  ["@markup.environment.name"] = { link = "Type" },
  ["@markup.quote"] = { fg = util.blend(c.fg, c.light_grey, 0.5) },

  -- vim
  ["@namespace.vim"] = { fg = c.orange },

  -- vimdoc
  ["@label.vimdoc"] = { fg = c.light_purple },
  ["@string.special.vimdoc"] = { fg = c.light_orange },

  -- css
  ["@type.tag.css"] = { fg = c.orange },
  ["@punctuation.bracket.css"] = { fg = c.mid_grey },

  -- gitcommit
  ["@keyword.gitcommit"] = { fg = c.blue },
  ["@text.title.gitcommit"] = { fg = c.orange, fmt = "bold" },

  -- typescript
  ["@attribute.typescript"] = { fg = c.blue },
}
hl.lsp = {
  ["@lsp.type.comment"] = {},
  ["@lsp.type.enum"] = hl.treesitter["@type"],
  ["@lsp.type.enumMember"] = hl.treesitter["@constant.builtin"],
  ["@lsp.type.interface"] = hl.treesitter["@type"],
  ["@lsp.type.typeParameter"] = hl.treesitter["@type"],
  ["@lsp.type.keyword"] = hl.treesitter["@keyword"],
  ["@lsp.type.namespace"] = hl.treesitter["@namespace"],
  ["@lsp.type.parameter"] = {},
  ["@lsp.type.property"] = hl.treesitter["@property"],
  ["@lsp.type.variable"] = {}, -- use treesitter styles for regular variables
  ["@lsp.type.macro"] = hl.treesitter["@function.macro"],
  ["@lsp.type.method"] = hl.treesitter["@method"],
  ["@lsp.type.number"] = hl.treesitter["@number"],
  ["@lsp.type.generic"] = hl.treesitter["@text"],
  ["@lsp.type.builtinType"] = hl.treesitter["@type.builtin"],
  ["@lsp.typemod.method.defaultLibrary"] = hl.treesitter["@function"],
  ["@lsp.typemod.function.defaultLibrary"] = { fg = c.red },
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
local diag_error = cfg.diagnostics.darker and c.dark_red or c.red
local diag_hint = cfg.diagnostics.darker and c.dark_purple or c.purple
local diag_warn = cfg.diagnostics.darker and c.dark_yellow or c.yellow
local diag_info = cfg.diagnostics.darker and c.dark_cyan or c.cyan
hl.plugins.lsp = {
  LspCxxHlGroupEnumConstant = { fg = c.orange },
  LspCxxHlGroupMemberVariable = { fg = c.orange },
  LspCxxHlGroupNamespace = { fg = c.blue },
  LspCxxHlSkippedRegion = { fg = c.grey },
  LspCxxHlSkippedRegionBeginEnd = { fg = c.red },

  DiagnosticError = { fg = c.red },
  DiagnosticHint = { fg = c.purple },
  DiagnosticInfo = { fg = c.cyan },
  DiagnosticWarn = { fg = c.yellow },

  DiagnosticVirtualTextError = {
    bg = cfg.diagnostics.background and util.darken(diag_error, 0.1, c.bg0) or c.none,
    fg = diag_error,
  },
  DiagnosticVirtualTextWarn = {
    bg = cfg.diagnostics.background and util.darken(diag_warn, 0.1, c.bg0) or c.none,
    fg = diag_warn,
  },
  DiagnosticVirtualTextInfo = {
    bg = cfg.diagnostics.background and util.darken(diag_info, 0.1, c.bg0) or c.none,
    fg = diag_info,
  },
  DiagnosticVirtualTextHint = {
    bg = cfg.diagnostics.background and util.darken(diag_hint, 0.1, c.bg0) or c.none,
    fg = diag_hint,
  },

  DiagnosticUnderlineError = {
    fmt = cfg.diagnostics.undercurl and "undercurl" or "underline",
    sp = c.red,
  },
  DiagnosticUnderlineHint = {
    fmt = cfg.diagnostics.undercurl and "undercurl" or "underline",
    sp = c.purple,
  },
  DiagnosticUnderlineInfo = {
    fmt = cfg.diagnostics.undercurl and "undercurl" or "underline",
    sp = c.blue,
  },
  DiagnosticUnderlineWarn = {
    fmt = cfg.diagnostics.undercurl and "undercurl" or "underline",
    sp = c.yellow,
  },

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
  CmpItemAbbr = { fg = c.fg },
  CmpItemAbbrDeprecated = { fg = c.light_grey, fmt = "strikethrough" },
  CmpItemAbbrMatch = { fg = c.cyan },
  CmpItemAbbrMatchFuzzy = { fg = c.cyan, fmt = "underline" },
  CmpItemMenu = { fg = c.mid_grey },
  CmpItemKind = {
    fg = c.purple,
    fmt = cfg.cmp_itemkind_reverse and "reverse",
  },
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
  WhichKey = { fg = c.red },
  WhichKeyDesc = { fg = c.blue },
  WhichKeyGroup = { fg = c.orange },
  WhichKeySeparator = { fg = c.green },
}

-- unchanged
hl.plugins.gitgutter = {
  GitGutterAdd = { fg = c.diff_add },
  GitGutterChange = { fg = c.diff_change },
  GitGutterDelete = { fg = c.diff_delete },
}

-- unchanged
hl.plugins.hop = {
  HopNextKey = { fg = c.red, fmt = "bold" },
  HopNextKey1 = { fg = c.cyan, fmt = "bold" },
  HopNextKey2 = { fg = util.darken(c.blue, 0.7) },
  HopUnmatched = { fg = c.grey },
}

-- unchanged
hl.plugins.diffview = {
  DiffviewFilePanelTitle = { fg = c.blue, fmt = "bold" },
  DiffviewFilePanelCounter = { fg = c.purple, fmt = "bold" },
  DiffviewFilePanelFileName = { fg = c.fg },
  DiffviewNormal = hl.common.Normal,
  DiffviewCursorLine = hl.common.CursorLine,
  DiffviewVertSplit = hl.common.VertSplit,
  DiffviewSignColumn = hl.common.SignColumn,
  DiffviewStatusLine = hl.common.StatusLine,
  DiffviewStatusLineNC = hl.common.StatusLineNC,
  DiffviewEndOfBuffer = hl.common.EndOfBuffer,
  DiffviewFilePanelRootPath = { fg = c.grey },
  DiffviewFilePanelPath = { fg = c.grey },
  DiffviewFilePanelInsertions = { fg = c.green },
  DiffviewFilePanelDeletions = { fg = c.red },
  DiffviewStatusAdded = { fg = c.green },
  DiffviewStatusUntracked = { fg = c.blue },
  DiffviewStatusModified = { fg = c.blue },
  DiffviewStatusRenamed = { fg = c.blue },
  DiffviewStatusCopied = { fg = c.blue },
  DiffviewStatusTypeChange = { fg = c.blue },
  DiffviewStatusUnmerged = { fg = c.blue },
  DiffviewStatusUnknown = { fg = c.red },
  DiffviewStatusDeleted = { fg = c.red },
  DiffviewStatusBroken = { fg = c.red },
}

-- tpope/vim-fugitive
hl.plugins.fugitive = {
  fugitiveHeader = { fg = c.mid_grey },
  fugitiveSection = { fg = c.light_grey },
  fugitiveUntrackedSection = { link = "fugitiveSection" },
  fugitiveUnstagedSection = { link = "fugitiveSection" },
  fugitiveStagedSection = { link = "fugitiveSection" },
  fugitiveHeading = { fg = c.purple },
  fugitiveUnstagedHeading = { link = "fugitiveHeading" },
  fugitiveUntrackedHeading = { link = "fugitiveHeading" },
  fugitiveStagedHeading = { link = "fugitiveHeading" },
  fugitiveUntrackedModifier = { fg = c.red },
  fugitiveUnstagedModifier = { fg = c.orange },
  fugitiveStagedModifier = { fg = c.orange },
  fugitiveSymbolicRef = { fg = c.green },
  fugitiveHash = { fg = util.darken(util.blend(c.yellow, c.bg0, 0.9), 0.9) },
  fugitiveHelpTag = { fg = c.blue },
}

hl.plugins.gitsigns = {
  GitSignsAdd = { fg = c.diff_add },
  GitSignsAddLn = { fg = c.diff_add },
  GitSignsAddNr = { fg = c.diff_add },
  GitSignsChange = { fg = c.diff_change },
  GitSignsChangeLn = { fg = c.diff_change },
  GitSignsChangeNr = { fg = c.diff_change },
  GitSignsDelete = { fg = c.diff_delete },
  GitSignsDeleteLn = { fg = c.diff_delete },
  GitSignsDeleteNr = { fg = c.diff_delete },
}

-- unchanged
hl.plugins.neo_tree = {
  NeoTreeNormal = { fg = c.fg, bg = cfg.transparent and c.none or c.bg2 },
  NeoTreeNormalNC = { fg = c.fg, bg = cfg.transparent and c.none or c.bg2 },
  NeoTreeVertSplit = { fg = c.bg1, bg = cfg.transparent and c.none or c.bg1 },
  NeoTreeWinSeparator = {
    fg = c.bg1,
    bg = cfg.transparent and c.none or c.bg1,
  },
  NeoTreeEndOfBuffer = {
    fg = cfg.ending_tildes and c.bg2 or c.bg2,
    bg = cfg.transparent and c.none or c.bg2,
  },
  NeoTreeRootName = { fg = c.orange, fmt = "bold" },
  NeoTreeGitAdded = { fg = c.green },
  NeoTreeGitDeleted = { fg = c.red },
  NeoTreeGitModified = { fg = c.yellow },
  NeoTreeGitConflict = { fg = c.red, fmt = "bold,italic" },
  NeoTreeGitUntracked = { fg = c.red, fmt = "italic" },
  NeoTreeIndentMarker = { fg = c.grey },
  NeoTreeSymbolicLinkTarget = { fg = c.purple },
}

-- unchanged
hl.plugins.neotest = {
  NeotestAdapterName = { fg = c.purple, fmt = "bold" },
  NeotestDir = { fg = c.cyan },
  NeotestExpandMarker = { fg = c.grey },
  NeotestFailed = { fg = c.red },
  NeotestFile = { fg = c.cyan },
  NeotestFocused = { fmt = "bold,italic" },
  NeotestIndent = { fg = c.grey },
  NeotestMarked = { fg = c.orange, fmt = "bold" },
  NeotestNamespace = { fg = c.blue },
  NeotestPassed = { fg = c.green },
  NeotestRunning = { fg = c.yellow },
  NeotestWinSelect = { fg = c.cyan, fmt = "bold" },
  NeotestSkipped = { fg = c.mid_grey },
  NeotestTarget = { fg = c.purple },
  NeotestTest = { fg = c.fg },
  NeotestUnknown = { fg = c.mid_grey },
}

hl.plugins.netrw = {
  netrwExe = { fg = c.green },
  netreDirectory = { fg = c.blue },
  netrwSymLink = { fg = c.cyan },
}

hl.plugins.nvim_tree = {
  NvimTreeNormal = { fg = c.fg, bg = cfg.transparent and c.none or c.bg2 },
  NvimTreeVertSplit = { fg = c.bg2, bg = cfg.transparent and c.none or c.bg2 },
  NvimTreeEndOfBuffer = {
    fg = cfg.ending_tildes and c.bg2 or c.bg2,
    bg = cfg.transparent and c.none or c.bg2,
  },
  NvimTreeRootFolder = { fg = c.orange, fmt = "bold" },
  NvimTreeGitDirty = { fg = c.yellow },
  NvimTreeGitNew = { fg = c.green },
  NvimTreeGitDeleted = { fg = c.red },
  NvimTreeSpecialFile = { fg = c.yellow, fmt = "underline" },
  NvimTreeIndentMarker = { fg = c.fg },
  NvimTreeImageFile = { fg = c.dark_purple },
  NvimTreeSymlink = { fg = c.purple },
  NvimTreeFolderName = { fg = c.blue },
}

hl.plugins.telescope = {
  TelescopeBorder = { fg = c.grey },
  TelescopeMatching = { fg = c.orange },
  TelescopePromptPrefix = { fg = c.grey },
  TelescopeSelection = { fg = c.fg, bg = c.bg2, fmt = "bold" },
  TelescopeSelectionCaret = { fg = c.light_orange, bg = c.bg2 },
  TelescopeMultiSelection = { fg = c.light_orange },
  TelescopeMultiIcon = { fg = c.red },
  TelescopeTitle = { fg = c.orange },
}

-- unchanged
hl.plugins.dashboard = {
  DashboardShortCut = { fg = c.blue },
  DashboardHeader = { fg = c.yellow },
  DashboardCenter = { fg = c.cyan },
  DashboardFooter = { fg = c.dark_red, fmt = "italic" },
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
  rainbowcol1 = { fg = c.mid_grey },
  rainbowcol2 = { fg = c.yellow },
  rainbowcol3 = { fg = c.blue },
  rainbowcol4 = { fg = c.orange },
  rainbowcol5 = { fg = c.purple },
  rainbowcol6 = { fg = c.green },
  rainbowcol7 = { fg = c.red },
}

-- unchanged
hl.plugins.ts_rainbow2 = {
  TSRainbowRed = { fg = c.red },
  TSRainbowYellow = { fg = c.yellow },
  TSRainbowBlue = { fg = c.blue },
  TSRainbowOrange = { fg = c.orange },
  TSRainbowGreen = { fg = c.green },
  TSRainbowViolet = { fg = c.purple },
  TSRainbowCyan = { fg = c.cyan },
}

-- unchanged
hl.plugins.rainbow_delimiters = {
  RainbowDelimiterRed = { fg = c.red },
  RainbowDelimiterYellow = { fg = c.yellow },
  RainbowDelimiterBlue = { fg = c.blue },
  RainbowDelimiterOrange = { fg = c.orange },
  RainbowDelimiterGreen = { fg = c.green },
  RainbowDelimiterViolet = { fg = c.purple },
  RainbowDelimiterCyan = { fg = c.cyan },
}

-- unchanged
hl.plugins.indent_blankline = {
  IndentBlanklineIndent1 = { fg = c.blue },
  IndentBlanklineIndent2 = { fg = c.green },
  IndentBlanklineIndent3 = { fg = c.cyan },
  IndentBlanklineIndent4 = { fg = c.mid_grey },
  IndentBlanklineIndent5 = { fg = c.purple },
  IndentBlanklineIndent6 = { fg = c.red },
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
  MiniStarterHeader = { fg = c.yellow },
  MiniStarterInactive = { fg = c.grey, fmt = cfg.code_style.comments },
  MiniStarterItem = { fg = c.fg, bg = cfg.transparent and c.none or c.bg0 },
  MiniStarterItemBullet = { fg = c.grey },
  MiniStarterItemPrefix = { fg = c.yellow },
  MiniStarterSection = { fg = c.mid_grey },
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
  MiniTablineModifiedHidden = {
    fg = c.light_grey,
    bg = c.bg1,
    fmt = "italic",
  },
  MiniTablineModifiedVisible = { fg = c.yellow, bg = c.bg0, fmt = "italic" },
  MiniTablineTabpageSection = { fg = c.bg0, bg = c.yellow },
  MiniTablineVisible = { fg = c.light_grey, bg = c.bg0 },

  MiniTestEmphasis = { fmt = "bold" },
  MiniTestFail = { fg = c.red, fmt = "bold" },
  MiniTestPass = { fg = c.green, fmt = "bold" },

  MiniTrailspace = { bg = c.red },
}

-- unchanged
hl.langs.c = {
  cInclude = { fg = c.blue },
  cStorageClass = { fg = c.purple },
  cTypedef = { fg = c.purple },
  cDefine = { fg = c.cyan },
  cTSInclude = { fg = c.blue },
  cTSConstant = { fg = c.cyan },
  cTSConstMacro = { fg = c.purple },
  cTSOperator = { fg = c.purple },
}

-- unchanged
hl.langs.cpp = {
  cppStatement = { fg = c.purple, fmt = "bold" },
  cppTSInclude = { fg = c.blue },
  cppTSConstant = { fg = c.cyan },
  cppTSConstMacro = { fg = c.purple },
  cppTSOperator = { fg = c.purple },
}

-- unchanged
hl.langs.markdown = {
  markdownBlockquote = { fg = c.grey },
  markdownBold = { fg = c.orange, fmt = "bold" },
  markdownBoldDelimiter = { fg = c.grey },
  markdownCode = { fg = c.green },
  markdownCodeBlock = { fg = c.green },
  markdownCodeDelimiter = { fg = c.yellow },
  markdownH1 = { fg = c.red, fmt = "bold" },
  markdownH2 = { fg = c.purple, fmt = "bold" },
  markdownH3 = { fg = c.orange, fmt = "bold" },
  markdownH4 = { fg = c.red, fmt = "bold" },
  markdownH5 = { fg = c.purple, fmt = "bold" },
  markdownH6 = { fg = c.orange, fmt = "bold" },
  markdownHeadingDelimiter = { fg = c.grey },
  markdownHeadingRule = { fg = c.grey },
  markdownId = { fg = c.yellow },
  markdownIdDeclaration = { fg = c.red },
  markdownItalic = { fg = c.none, fmt = "italic" },
  markdownItalicDelimiter = { fg = c.grey, fmt = "italic" },
  markdownLinkDelimiter = { fg = c.grey },
  markdownLinkText = { fg = c.red },
  markdownLinkTextDelimiter = { fg = c.grey },
  markdownListMarker = { fg = c.red },
  markdownOrderedListMarker = { fg = c.red },
  markdownRule = { fg = c.purple },
  markdownUrl = { fg = c.blue, fmt = "underline" },
  markdownUrlDelimiter = { fg = c.grey },
  markdownUrlTitleDelimiter = { fg = c.green },
}

-- unchanged
hl.langs.php = {
  phpFunctions = { fg = c.fg, fmt = cfg.code_style.functions },
  phpMethods = { fg = c.cyan },
  phpStructure = { fg = c.purple },
  phpOperator = { fg = c.purple },
  phpMemberSelector = { fg = c.fg },
  phpVarSelector = { fg = c.orange, fmt = cfg.code_style.variables },
  phpIdentifier = { fg = c.orange, fmt = cfg.code_style.variables },
  phpBoolean = { fg = c.cyan },
  phpNumber = { fg = c.orange },
  phpHereDoc = { fg = c.green },
  phpNowDoc = { fg = c.green },
  phpSCKeyword = { fg = c.purple, fmt = cfg.code_style.keywords },
  phpFCKeyword = { fg = c.purple, fmt = cfg.code_style.keywords },
  phpRegion = { fg = c.blue },
}

-- unchanged
hl.langs.scala = {
  scalaNameDefinition = { fg = c.fg },
  scalaInterpolationBoundary = { fg = c.purple },
  scalaInterpolation = { fg = c.purple },
  scalaTypeOperator = { fg = c.red },
  scalaOperator = { fg = c.red },
  scalaKeywordModifier = { fg = c.red, fmt = cfg.code_style.keywords },
}

-- unchanged
hl.langs.tex = {
  latexTSInclude = { fg = c.blue },
  latexTSFuncMacro = { fg = c.fg, fmt = cfg.code_style.functions },
  latexTSEnvironment = { fg = c.cyan, fmt = "bold" },
  latexTSEnvironmentName = { fg = c.yellow },
  texCmdEnv = { fg = c.cyan },
  texEnvArgName = { fg = c.yellow },
  latexTSTitle = { fg = c.green },
  latexTSType = { fg = c.blue },
  latexTSMath = { fg = c.orange },
  texMathZoneX = { fg = c.orange },
  texMathZoneXX = { fg = c.orange },
  texMathDelimZone = { fg = c.mid_grey },
  texMathDelim = { fg = c.purple },
  texMathOper = { fg = c.red },
  texCmd = { fg = c.purple },
  texCmdPart = { fg = c.blue },
  texCmdPackage = { fg = c.blue },
  texPgfType = { fg = c.yellow },
}

-- unchanged
hl.langs.vim = {
  vimOption = { fg = c.red },
  vimSetEqual = { fg = c.yellow },
  vimMap = { fg = c.purple },
  vimMapModKey = { fg = c.orange },
  vimNotation = { fg = c.red },
  vimMapLhs = { fg = c.fg },
  vimMapRhs = { fg = c.blue },
  vimCommentTitle = { fg = c.light_grey, fmt = cfg.code_style.comments },
  vimFuncKey = { fg = c.purple },
  vimFuncVar = { fg = c.red },
  vimOper = { fg = c.mid_grey },
  vimOperParen = { link = "vimOper" },
  vimFunction = { fg = c.blue },
  vimCommand = { fg = c.purple },
  vimIsCommand = { fg = c.orange },
  vimLet = { fg = c.red },
  vimSubst = { fg = c.yellow },
  vimVar = { fg = c.fg, fmt = cfg.code_style.variables },
}

-- TODO: revivew these
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
    hl.plugins.cmp["CmpItemKind" .. kind] =
      { fg = color, fmt = cfg.cmp_itemkind_reverse and "reverse" }
    hl.plugins.outline["Aerial" .. kind .. "Icon"] = { fg = color }
    hl.plugins.navic["NavicIcons" .. kind] = { fg = color }
  end

  vim_highlights(hl.common)
  vim_highlights(hl.syntax)
  vim_highlights(hl.treesitter)
  if hl.lsp then
    vim_highlights(hl.lsp)
  end
  for _, group in pairs(hl.langs) do
    vim_highlights(group)
  end
  for _, group in pairs(hl.plugins) do
    vim_highlights(group)
  end

  -- user defined highlights: vim_highlights function cannot be used because it sets an attribute to none if not specified
  local function replace_color(prefix, color_name)
    if not color_name then
      return ""
    end
    if color_name:sub(1, 1) == "$" then
      local name = color_name:sub(2, -1)
      color_name = c[name]
      if not color_name then
        vim.schedule(function()
          vim.notify(
            'tairiki.nvim: unknown color "' .. name .. '"',
            vim.log.levels.ERROR,
            { title = "tairiki.nvim" }
          )
        end)
        return ""
      end
    end
    return prefix .. "=" .. color_name
  end

  for group_name, group_settings in pairs(vim.g.tairiki_config.highlights) do
    if group_settings.link then
      vim.api.nvim_command(string.format("highlight! link %s %s", group_name, group_settings.link))
    else
      vim.api.nvim_command(
        string.format(
          "highlight %s %s %s %s %s",
          group_name,
          replace_color("guifg", group_settings.fg),
          replace_color("guibg", group_settings.bg),
          replace_color("guisp", group_settings.sp),
          replace_color("gui", group_settings.fmt)
        )
      )
    end
  end
end

return M
