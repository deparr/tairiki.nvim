local M = {}

-- see :help treesitter-highlight-groups for group info

---@param c tairiki.Palette
---@return table<string, vim.api.keyset.highlight>
function M.get(c, opts)
	local ret = {
		["@variable"]                   = { fg = c.syn.ident },
		["@variable.builtin"]           = { fg = c.syn.special },
		["@variable.parameter"]         = { fg = c.fg, italic = true },
		["@variable.parameter.builtin"] = { fg = c.syn.special, italic = true },
		["@variable.member"]            = { fg = c.syn.ident },
		["@constant"]                   = "Constant",
		["@constant.builtin"]           = { fg = c.syn.special },
		["@constant.macro"]             = "Macro",
		["@module"]                     = { fg = c.blue },      -- todo
		["@module.builtin"]             = { fg = c.syn.special }, -- todo rethink
		["@label"]                      = { fg = c.blue },
		["@string"]                     = "String",
		["@string.special.url"]         = { fg = c.cyan, underline = true },
		["@character"]                  = "String",
		["@chracter.special"]           = { fg = c.syn.special },
		["@boolean"]                    = "Boolean",
		["@number"]                     = "Number",
		["@number.float"]               = "Float",
		["@type"]                       = { fg = c.syn.type },
		["@type.builtin"]               = { fg = c.cyan },
		["@attribute"]                  = { fg = c.cyan },
		["@property"]                   = { fg = c.syn.ident },
		["@function"]                   = "Function",
		["@function.builtin"]           = { fg = c.syn.special },
		["@constructor"]                = { fg = c.syn.special }, -- todo rethink
		["@operator"]                   = "Operator",
		["@keyword"]                    = { fg = c.syn.keyword, }, -- TODO specific token styles
		["@keyword.coroutine"]          = "@keyword",
		-- ["@keyword.function"]           = {},                        -- todo util
		-- ["@keyword.operator"]           = {},                        -- todo util
		-- ["@keyword.import"]             = {},                        -- todo util
		-- ["@keyword.type"]               = {},                        -- todo util
		["@keyword.modifier"]           = { fg = c.syn.keyword_mod }, -- todo util
		-- ["@keyword.repeat"]             = {},                        -- todo util
		-- ["@keyword.return"]             = {},                        -- todo util
		-- ["@keyword.debug"]              = {},                        -- todo util
		-- ["@keyword.exception"]          = {},                        -- todo util
		["@keyword.conditional"]        = "Conditional",            -- todo util
		["@keyword.directive"]          = { fg = c.syn.keyword_mod }, -- todo util
		["@punctuation.delimiter"]      = { fg = c.syn.delim },
		["@punctuation.bracket"]        = { fg = c.syn.delim },
		["@punctuation.special"]        = { fg = c.syn.special }, -- todo rethink
		["@comment"]                    = "Comment",
		["@comment.error"]              = { fg = c.diag.error },
		["@comment.warning"]            = { fg = c.diag.warn },
		["@comment.todo"]               = { fg = c.yellow },
		["@comment.note"]               = { fg = c.diag.info },
		["@markup.strong"]              = { bold = true },
		["@markup.italic"]              = { italic = true },
		["@markup.strikethrough"]       = { strikethrough = true },
		["@markup.underline"]           = { underline = true },
		["@markup.heading"]             = "Title",
		["@markup.quote"]               = { fg = c.fg },
		["@markup.math"]                = { fg = c.cyan },    -- todo util
		["@markup.link"]                = { fg = c.blue },    -- todo util
		["@markup.link.label"]          = { fg = c.orange },  -- todo util
		["@markup.link.url"]            = { underline = true }, -- todo util
		["@markup.raw"]                 = "String",
		["@markup.list"]                = "TairikiTODO",
		["@markup.list.checked"]        = "TairikiTODO",
		["@markup.list.unchecked"]      = "TairikiTODO",
		["@diff.plus"]                  = "DiffAdd",
		["@diff.minus"]                 = "DiffDelete",
		["@diff.delta"]                 = "DiffChange",
		["@tag"]                        = "Label",
		["@tag.builtin"]                = { fg = c.syn.special },
		["@tag.attribute"]              = "@property",
		["@tag.delimiter"]              = "Delimiter",
	}

	-- if opts.rainbow_heading then
	-- end

	return ret
end

return M
