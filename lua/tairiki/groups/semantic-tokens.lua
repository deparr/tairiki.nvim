local M = {}

-- see :help lsp-semantic-highlight for group info

---@param c tairiki.Palette
---@return table<string, vim.api.keyset.highlight>
function M.get(c, opts)
	return {
		["@lsp.type.class"]         = { fg = c.syn.type },
		["@lsp.type.comment"]       = { fg = c.comment },
		["@lsp.type.decorator"]     = "Macro",
		["@lsp.type.enum"]          = { fg = c.syn.type },
		["@lsp.type.enumMember"]    = { fg = c.syn.literal },
		["@lsp.type.event"]         = { fg = c.syn.special },
		["@lsp.type.function"]      = { fg = c.syn.func },
		["@lsp.type.interface"]     = { fg = c.syn.type },
		["@lsp.type.keyword"]       = { fg = c.syn.keyword },
		["@lsp.type.macro"]         = { fg = c.syn.constant },
		["@lsp.type.method"]        = { fg = c.syn.func },
		["@lsp.type.modifier"]      = { fg = c.syn.keyword_mod },
		["@lsp.type.namespace"]     = { fg = c.syn.ident}, -- todo
		["@lsp.type.number"]        = { fg = c.syn.literal },
		["@lsp.type.operator"]      = { fg = c.syn.operator },
		["@lsp.type.parameter"]     = { fg = c.syn.ident, italic = true },
		["@lsp.type.property"]      = { fg = c.syn.ident },
		["@lsp.type.regexp"]        = { fg = c.syn.special },
		["@lsp.type.string"]        = { fg = c.syn.string },
		["@lsp.type.struct"]        = { fg = c.syn.type },
		["@lsp.type"]               = { fg = c.syn.type },
		["@lsp.type.type"]          = { fg = c.syn.type },
		["@lsp.type.typeParameter"] = { fg = c.syn.type }, -- todo darken
		["@lsp.type.variable"]      = { fg = c.syn.ident }, -- todo this seems weird

		-- TODO big
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
