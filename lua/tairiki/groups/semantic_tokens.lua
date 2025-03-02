local util = require("tairiki.util")
local M = {}

-- see :help lsp-semantic-highlight for group info

---@param c tairiki.Palette
---@return table<string, vim.api.keyset.highlight>
function M.get(c, opts)
  -- stylua: ignore
  return {
    ["@lsp.type.class"]         = { fg = c.syn.type },
    ["@lsp.type.comment"]       = { fg = c.comment },
    ["@lsp.type.decorator"]     = "Macro",
    ["@lsp.type.enum"]          = { fg = c.syn.type },
    ["@lsp.type.enumMember"]    = { fg = c.syn.literal },
    ["@lsp.type.event"]         = { fg = c.syn.special },
    ["@lsp.type.function"]      = { fg = c.syn.func, style = opts.code_style.functions },
    ["@lsp.type.interface"]     = { fg = c.syn.type },
    ["@lsp.type.keyword"]       = { fg = c.syn.keyword },
    ["@lsp.type.macro"]         = "Macro",
    ["@lsp.type.method"]        = { fg = c.syn.func },
    ["@lsp.type.modifier"]      = { fg = c.syn.keyword_mod },
    ["@lsp.type.namespace"]     = { fg = c.syn.ident },
    ["@lsp.type.number"]        = { fg = c.syn.literal },
    ["@lsp.type.operator"]      = { fg = c.syn.operator },
    ["@lsp.type.parameter"]     = { fg = c.syn.ident, style = opts.code_style.parameters },
    ["@lsp.type.property"]      = { fg = c.syn.ident },
    ["@lsp.type.regexp"]        = { fg = c.syn.special },
    ["@lsp.type.string"]        = { fg = c.syn.string },
    ["@lsp.type.struct"]        = { fg = c.syn.type },
    ["@lsp.type"]               = {},
    ["@lsp.type.builtinType"]   = "@type.builtin",
    ["@lsp.type.type"]          = { fg = c.syn.type },
    ["@lsp.type.typeParameter"] = { fg = util.darken(c.syn.type, 0.9), style = opts.code_style.parameters },
    ["@lsp.type.variable"]      = { fg = c.syn.ident },

    ["@lsp.mod.abstract"]       = {},
    ["@lsp.mod.async"]          = {},
    ["@lsp.mod.declaration"]    = {},
    ["@lsp.mod.defaultLibrary"] = {},
    ["@lsp.mod.definition"]     = {},
    ["@lsp.mod.deprecated"]     = { strikethrough = true },
    ["@lsp.mod.documentation"]  = {},
    ["@lsp.mod.modification"]   = {},
    ["@lsp.mod.readonly"]       = {},
    ["@lsp.mod.static"]         = {},
  }
end

return M
