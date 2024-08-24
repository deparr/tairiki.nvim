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
  ModeMsg = { fg = c.light_grey },
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
  FloatBorder = { fg = c.hc_bg, bg = c.hc_bg },
  FloatShadow = { fg = c.hc_bg, bg = c.hc_bg },
  FloatShadowThrough = { fg = c.hc_bg, bg = c.hc_bg },
  NormalFloat = { fg = c.fg, bg = c.hc_bg },
  FloatTitle = { bg = c.hc_bg },
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
  Conditional = { fg = c.red, fmt = cfg.code_style.conditionals },
  Repeat = { fg = c.light_purple, fmt = cfg.code_style.keywords },
  Statement = { fg = c.green },
  Macro = { fg = c.light_orange },
  Error = { fg = c.red },
  Label = { fg = c.light_orange },
  Special = { fg = c.red, fmt = "bold" },
  SpecialChar = { fg = c.red },
  Function = { fg = c.blue, fmt = cfg.code_style.functions },
  Operator = { fg = c.light_grey },
  Title = { fg = c.fg, fmt = "bold" },
  Tag = { fg = c.red },
  Delimiter = { fg = c.grey },
  Comment = { fg = c.comment, fmt = cfg.code_style.comments },
  SpecialComment = { fg = c.comment, fmt = cfg.code_style.comments },
  Todo = { fg = c.yellow, fmt = "bold" },
}

hl.treesitter = {
  ["@variable"] = { fg = c.fg, fmt = cfg.code_style.variables },
  ["@variable.builtin"] = { fg = c.red, fmt = cfg.code_style.variables },
  ["@variable.parameter"] = { fg = c.fg },
  ["@variable.parameter.builtin"] = { fg = c.red },
  ["@variable.member"] = { fg = c.cyan },

  ["@constant"] = { fg = c.orange, fmt = cfg.code_style.constants },
  ["@constant.builtin"] = { fg = c.orange, fmt = cfg.code_style.constants },
  ["@constant.macro"] = { fg = c.orange, fmt = cfg.code_style.constants },

  ["@module"] = { fg = util.lighten(c.fg, 0.7, c.blue) },
  ["@module.builtin"] = { fg = c.red },
  ["@label"] = { fg = c.blue },

  ["@string"] = { link = "String" },
  -- @string.documentation
  ["@string.regexp"] = { fg = c.orange, fmt = cfg.code_style.strings },
  ["@string.escape"] = { fg = c.red, fmt = cfg.code_style.strings },
  ["@string.special"] = { link = "SpecialChar" },
  -- @string.special.symbol
  -- @string.special.path
  ["@string.special.url"] = { fg = c.blue, fmt = "underline" },

  ["@character"] = { fg = c.green },
  ["@character.special"] = { link = "SpecialChar" },

  ["@boolean"] = { fg = c.light_orange },
  ["@number"] = { link = "Number" },
  ["@number.float"] = { link = "Float" },

  ["@type"] = { fg = c.yellow },
  ["@type.builtin"] = { fg = c.light_orange },
  -- @type.definition

  ["@attribute"] = { fg = c.cyan },
  ["@attribute.builtin"] = { fg = c.red },
  ["@property"] = { fg = c.cyan },

  ["@function"] = { fg = c.blue, fmt = cfg.code_style.functions },
  ["@function.builtin"] = { fg = c.red, fmt = cfg.code_style.functions },
  -- @function.call
  ["@function.macro"] = { fg = hl.syntax.Macro.fg, fmt = cfg.code_style.functions },
  ["@function.method"] = { fg = c.blue, fmt = cfg.code_style.functions },
  -- @function.method.call

  ["@constructor"] = { fg = c.yellow },
  ["@operator"] = { fg = c.light_grey },

  ["@keyword"] = { fg = c.purple, fmt = cfg.code_style.keywords },
  ["@keyword.coroutine"] = { fg = c.light_purple, fmt = cfg.code_style.keywords },
  ["@keyword.function"] = { fg = c.light_purple, fmt = cfg.code_style.functions },
  ["@keyword.operator"] = { fg = c.light_purple, fmt = cfg.code_style.keywords },
  -- @keyword.import
  -- @keyword.type
  ["@keyword.modifier"] = { fg = c.light_purple, fmt = cfg.code_style.keywords },
  -- @keyword.repeat
  ["@keyword.return"] = { fg = c.purple, fmt = cfg.code_style.keywords },
  -- @keyword.debug
  ["@keyword.exception"] = { fg = c.red, fmt = cfg.code_style.keywords },

  ["@keyword.conditional"] = { link = "Conditional" },
  -- @keyword.conditional.ternary

  -- @keyword.directive
  -- @keyword.directive.define

  ["@punctuation.delimiter"] = { fg = c.grey },
  ["@punctuation.bracket"] = { fg = c.grey },
  ["@punctuation.special"] = { fg = c.red },

  ["@comment"] = { fg = c.comment, fmt = cfg.code_style.comments },
  -- @comment.documentation

  -- @comment.error -> DiagnosticError
  -- @comment.warn -> DiagnosticWarn
  -- @comment.todo -> Todo
  -- @comment.info -> DiagnosticInfo

  ["@markup.strong"] = { fg = c.fg, fmt = "bold" },
  ["@markup.italic"] = { fg = c.fg, fmt = "italic" },
  ["@markup.strikethrough"] = { fg = c.fg, fmt = "strikethrough" },
  ["@markup.underline"] = { fg = c.fg, fmt = "underline" },

  ["@markup.heading"] = { link = "Title" },
  -- @markup.heading.1
  -- @markup.heading.2
  -- @markup.heading.3
  -- @markup.heading.4
  -- @markup.heading.5
  -- @markup.headina.6

  ["@markup.quote"] = { fg = c.mid_grey },
  ["@markup.math"] = { fg = c.blue },

  ["@markup.link"] = { fg = c.blue },
  ["@markup.link.label"] = { fg = c.orange },
  ["@markup.link.url"] = { fg = c.blue, fmt = "underline" },

  ["@markup.raw"] = { fg = c.green },
  ["@markup.raw.block"] = { fg = c.mid_grey },

  ["@markup.list"] = { link = "Special" },
  ["@markup.list.checked"] = { fg = c.diff_add, fmt = "bold" },
  ["@markup.list.unchecked"] = { fg = c.grey, fmt = "bold" },

  ["@diff.plus"] = { link = "DiffAdd" },
  ["@diff.minus"] = { link = "DiffDelete" },
  ["@diff.delta"] = { link = "DiffChange" },

  ["@tag"] = { fg = c.red },
  -- @tag.builtin -> Special
  ["@tag.attribute"] = { fg = c.orange },
  ["@tag.delimiter"] = { fg = c.mid_grey },
  --
  ["@none"] = {},

  -- language specific

  -- latex
  ["@function.latex"] = { fg = c.blue },

  -- markdown_inline
  -- ["@markup.strong.markdown_inline"] = { fg = c.light_orange, fmt = "bold" }, -- not sure here
  -- ["@markup.italic.markdown_inline"] = { fg = c.light_orange, fmt = "italic" },
  -- ["@markup.strikethrough.markdown_inline"] = { fmt = "strikethrough" },
  -- ["@conceal.markdown_inline"] = { fg = c.light_grey },
  -- ["@label.markdown"] = { link = "Tag" },
  -- ["@markup.environment"] = { fg = c.cyan, fmt = "bold" },
  -- ["@markup.environment.name"] = { link = "Type" },
  --
  -- -- vim
  -- ["@namespace.vim"] = { fg = c.orange },
  --
  -- -- vimdoc
  ["@label.vimdoc"] = { fg = c.light_purple },
  ["@string.special.vimdoc"] = { fg = c.light_orange },
  --
  -- -- css
  -- ["@type.tag.css"] = { fg = c.orange },
  -- ["@punctuation.bracket.css"] = { fg = c.mid_grey },
  --
  -- -- gitcommit
  -- ["@keyword.gitcommit"] = { fg = c.blue },
  -- ["@text.title.gitcommit"] = { fg = c.orange, fmt = "bold" },
  --
  -- -- typescript
  -- ["@attribute.typescript"] = { fg = c.blue },
}

hl.lsp = {
  ["@lsp.type.comment"] = {},
  ["@lsp.type.decorator"] = { link = "Macro" },
  ["@lsp.type.enum"] = hl.treesitter["@type"],
  ["@lsp.type.enumMember"] = hl.treesitter["@constant.builtin"],
  ["@lsp.type.interface"] = hl.treesitter["@type"],
  ["@lsp.type.typeParameter"] = hl.treesitter["@type"],
  ["@lsp.type.keyword"] = hl.treesitter["@keyword"],
  ["@lsp.type.namespace"] = hl.treesitter["@namespace"],
  ["@lsp.type.parameter"] = {},
  ["@lsp.type.property"] = { fg = c.cyan },
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
  -- rust
  ["@lsp.type.lifetime.rust"] = { fg = c.red },

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
  DiagnosticUnderlineOk = {
    fmt = cfg.diagnostics.undercurl and "undercurl" or "underline",
    sp = c.green,
  },
  DiagnosticUnderlineWarn = {
    fmt = cfg.diagnostics.undercurl and "undercurl" or "underline",
    sp = c.yellow,
  },

  DiagnosticError = { fg = c.red },
  DiagnosticHint = { fg = c.purple },
  DiagnosticInfo = { fg = c.cyan },
  DiagnosticOk = { fg = c.green },
  DiagnosticWarn = { fg = c.yellow },

  LspReferenceText = { bg = c.bg2 },
  LspReferenceWrite = { bg = c.bg2 },
  LspReferenceRead = { bg = c.bg2 },

  LspCodeLens = { fg = c.grey, fmt = cfg.code_style.comments },
  LspCodeLensSeparator = { fg = c.grey },

  LspInfoBorder = { link = "FloatBorder" },
  LspInfoFloat = { link = "NormalFloat" },
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
  end

  vim_highlights(hl.common)
  vim_highlights(hl.syntax)
  vim_highlights(hl.treesitter)
  vim_highlights(hl.lsp)
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
