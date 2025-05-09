local util = require("tairiki.util")
local M = {}

-- see :help highlight-groups for group info

---@return tairiki.Highlights
function M.get(c, opts)
  --stylua: ignore
  return {
    ColorColumn                 = { bg = c.bg_light },
    Conceal                     = { fg = c.comment },
    CurSearch                   = { fg = c.bg, bg = c.orange },
    Cursor                      = { fg = c.bg, bg = c.fg },
    CursorColumn                = { bg = c.bg_light },
    CursorIM                    = { fg = c.bg, bg = c.fg },
    CursorLine                  = { bg = c.bg_light },
    CursorLineFold              = "FoldColumn",
    CursorLineNr                = { fg = c.fg, bold = true },
    CursorLineSign              = "SignColumn",
    DiffAdd                     = { fg = c.fg, bg = c.diff.add },
    DiffChange                  = { fg = c.fg, bg = c.diff.change },
    DiffDelete                  = { fg = c.red, bg = c.diff.remove },
    DiffText                    = { fg = c.fg, bg = c.diff.text },
    Directory                   = { fg = c.blue },
    EndOfBuffer                 = { fg = opts.end_of_buffer and c.fg_dark or c.bg },
    ErrorMsg                    = { fg = c.diag.error, bold = true },
    FloatBorder                 = { fg = c.fg_dark, bg = c.bg_light },
    FloatFooter                 = "FloatTitle",
    FloatTitle                  = { fg = c.fg, bg = c.bg_light, bold = true },
    FoldColumn                  = "SignColumn",
    Folded                      = { fg = c.fg, bg = opts.transparent and c.none or c.bg_light },
    IncSearch                   = { fg = c.bg, bg = c.orange },
    LineNr                      = { fg = c.fg_dark2 },
    LineNrAbove                 = "LineNr",
    LineNrBelow                 = "LineNr",
    MatchParen                  = { fg = c.orange },
    ModeMsg                     = { fg = c.fg_dark },
    MoreMsg                     = { fg = c.purple },
    MsgArea                     = { fg = c.none, bg = c.none },
    MsgSeparator                = "StatusLine",
    NonText                     = { fg = c.fg_dark },
    Normal                      = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
    NormalFloat                 = { fg = c.fg, bg = c.bg_light },
    NormalNC                    = { fg = c.none, bg = c.none },
    Pmenu                       = { fg = c.fg_dark, bg = c.bg_light },
    PmenuExtra                  = "Pmenu",
    PmenuExtraSel               = "PmenuSel",
    PmenuKind                   = "Pmenu",
    PmenuKindSel                = "PmenuSel",
    PmenuMatch                  = { bold = true },
    PmenuMatchSel               = { bold = true },
    PmenuSbar                   = { fg = c.none, bg = c.bg_light2 },
    PmenuSel                    = { fg = c.blue, bg = c.bg_light2 },
    PmenuThumb                  = { fg = c.fg_dark3, bg = c.fg_dark3 },
    Question                    = { fg = c.yellow },
    QuickFixLine                = { bg = c.bg_light2 },
    Search                      = { fg = c.bg, bg = c.yellow },
    SignColumn                  = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
    SnippetTabstop              = "Visual",
    SpecialKey                  = { fg = c.fg_dark },
    SpellBad                    = { sp = c.red, underline = not opts.diagnostics.undercurl, undercurl = opts.diagnostics.undercurl },
    SpellCap                    = { sp = c.fg_dark, underline = not opts.diagnostics.undercurl, undercurl = opts.diagnostics.undercurl },
    SpellLocal                  = { sp = c.fg_dark, underline = not opts.diagnostics.undercurl, undercurl = opts.diagnostics.undercurl },
    SpellRare                   = { sp = c.purple, underline = not opts.diagnostics.undercurl, undercurl = opts.diagnostics.undercurl },
    StatusLine                  = { fg = c.fg_dark, bg = c.bg_light },
    StatusLineNC                = { fg = c.fg_dark2, bg = c.bg_light },
    StatusLineTerm              = { fg = c.fg_dark, bg = c.bg_light },
    StatusLineTermNC            = { fg = c.fg_dark2, bg = c.bg_light },
    Substitute                  = "CurSearch",
    TabLine                     = { fg = c.comment, bg = c.bg },
    TabLineFill                 = { bg = c.bg },
    TabLineSel                  = { fg = c.bg, bg = c.comment },
    TermCursor                  = "Cursor",
    TermCursorNC                = {},
    Title                       = { fg = c.fg, bold = true },
    Visual                      = { fg = c.none, bg = c.bg_light3, bold = opts.visual_bold },
    VisualNOS                   = "Visual",
    WarningMsg                  = { fg = c.diag.warn, bold = true },
    Whitespace                  = { fg = c.fg_dark3 },
    WildMenu                    = "CurSearch",
    WinBar                      = "StatusLine",
    WinBarNC                    = "StatusLineNC",
    WinSeparator                = { fg = c.fg_dark3 },
    lCursor                     = { fg = c.bg, bg = c.fg },

    Added                       = { fg = c.green },
    Bold                        = { bold = true },
    Boolean                     = { fg = c.syn.literal },
    Changed                     = { fg = c.blue },
    Character                   = { fg = c.syn.string },
    Comment                     = { fg = c.comment, style = opts.code_style.comments },
    Conditional                 = { fg = c.syn.keyword, style = opts.code_style.conditionals },
    Constant                    = { fg = c.syn.constant },
    Debug                       = { fg = c.diag.warn },
    Define                      = { fg = c.syn.keyword },
    Delimiter                   = { fg = c.syn.delim },
    Error                       = { fg = c.diag.error },
    Exception                   = { fg = c.syn.exception },
    Float                       = { fg = c.syn.literal },
    Function                    = { fg = c.syn.func, style = opts.code_style.functions },
    Identifier                  = { fg = c.syn.ident, style = opts.code_style.variables },
    Ignore                      = { fg = c.fg_dark },
    Include                     = { fg = c.syn.keyword },
    Italic                      = { italic = true },
    Keyword                     = { fg = c.syn.keyword, style = opts.code_style.keywords },
    Label                       = { fg = c.blue },
    Macro                       = { fg = c.syn.literal },
    Number                      = { fg = c.syn.literal },
    Operator                    = { fg = c.syn.operator },
    PreCondit                   = { fg = c.syn.keyword_mod },
    PreProc                     = { fg = c.syn.keyword },
    Removed                     = { fg = c.red },
    Repeat                      = { fg = c.syn.keyword, style = opts.code_style.keywords },
    Special                     = { fg = c.syn.special, bold = true },
    SpecialChar                 = { fg = c.syn.special },
    SpecialComment              = "Comment",
    Statement                   = { fg = c.red },
    StorageClass                = { fg = c.syn.keyword_mod },
    String                      = { fg = c.syn.string, style = opts.code_style.strings },
    Structure                   = { fg = c.syn.type, style = opts.code_style.types },
    Tag                         = { fg = c.syn.special },
    Todo                        = { fg = c.diag.warn, bold = true },
    Type                        = { fg = c.syn.type, style = opts.code_style.types },
    Typedef                     = { fg = c.syn.type },
    Underlined                  = { underline = true },

    LspCodeLens                 = { fg = c.fg_dark2, style = opts.code_style.comments },
    LspCodeLensSeparator        = { fg = c.fg_dark, style = opts.code_style.comments },
    LspInfoBorder               = { fg = c.fg_dark, bg = opts.transparent and c.none or c.bg_light },
    LspInlayHint                = "NonText",
    LspReferenceRead            = { bg = c.bg_light2 },
    LspReferenceTarget          = { bg = c.bg_light2 },
    LspReferenceText            = { bg = c.bg_light2 },
    LspReferenceWrite           = { bg = c.bg_light2 },
    LspSignatureActiveParameter = { underline = true, bold = true },

    DiagnosticOk                = { fg = c.diag.ok },
    DiagnosticHint              = { fg = c.diag.hint },
    DiagnosticInfo              = { fg = c.diag.info },
    DiagnosticWarn              = { fg = c.diag.warn },
    DiagnosticError             = { fg = c.diag.error },
    DiagnosticUnderlineOk       = { sp = c.diag.ok, underline = not opts.diagnostics.undercurl, undercurl = opts.diagnostics.undercurl },
    DiagnosticUnderlineHint     = { sp = c.diag.hint, underline = not opts.diagnostics.undercurl, undercurl = opts.diagnostics.undercurl },
    DiagnosticUnderlineInfo     = { sp = c.diag.info, underline = not opts.diagnostics.undercurl, undercurl = opts.diagnostics.undercurl },
    DiagnosticUnderlineWarn     = { sp = c.diag.warn, underline = not opts.diagnostics.ndercurl, undercurl = opts.diagnostics.undercurl },
    DiagnosticUnderlineError    = { sp = c.diag.error, underline = not opts.diagnostics.undercurl, undercurl = opts.diagnostics.undercurl },

    DiagnosticVirtualTextOk     = {
      fg = opts.diagnostics.darker and util.darken(c.diag.ok, 0.85, c.bg) or c.diag.ok,
      bg = opts.diagnostics.background and util.darken(c.diag.ok, 0.1, c.bg) or c.none
    },
    DiagnosticVirtualTextHint   = {
      fg = opts.diagnostics.darker and util.darken(c.diag.hint, 0.85, c.bg) or c.diag.hint,
      bg = opts.diagnostics.background and util.darken(c.diag.hint, 0.1, c.bg) or c.none
    },
    DiagnosticVirtualTextInfo   = {
      fg = opts.diagnostics.darker and util.darken(c.diag.info, 0.85, c.bg) or c.diag.info,
      bg = opts.diagnostics.background and util.darken(c.diag.info, 0.1, c.bg) or c.none
    },
    DiagnosticVirtualTextWarn   = {
      fg = opts.diagnostics.darker and util.darken(c.diag.warn, 0.85, c.bg) or c.diag.warn,
      bg = opts.diagnostics.background and util.darken(c.diag.warn, 0.1, c.bg) or c.none
    },
    DiagnosticVirtualTextError  = {
      fg = opts.diagnostics.darker and util.darken(c.diag.error, 0.85, c.bg) or c.diag.error,
      bg = opts.diagnostics.background and util.darken(c.diag.error, 0.1, c.bg) or c.none
    },

    diffAdded   = "Added",
    diffRemoved = "Removed",
    diffChanged = "Changed",
    diffFile    = { fg = c.blue },
    diffLine    = { fg = c.cyan },

    -- double define @variable so the theme is always cohesive, even when
    -- opts.plugins.none is given.
    -- avoids https://github.com/morhetz/gruvbox/issues/459
    ["@variable"] = { fg = c.syn.ident },
  }
end

return M
