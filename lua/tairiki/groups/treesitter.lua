local util = require "tairiki.util"
local M = {}

-- see :help treesitter-highlight-groups for group info

---@param c tairiki.Palette
---@return table<string, vim.api.keyset.highlight>
function M.get(c, opts)
	local ret = {
		["@variable"]                   = { fg = c.syn.ident, style = opts.code_style.variables },
		["@variable.builtin"]           = { fg = c.syn.special, style = opts.code_style.variables },
		["@variable.parameter"]         = { fg = c.fg, italic = true },
		["@variable.parameter.builtin"] = { fg = c.syn.special, italic = true },
		["@variable.member"]            = { fg = c.syn.ident },
		["@constant"]                   = "Constant",
		["@constant.builtin"]           = { fg = c.syn.special },
		["@constant.macro"]             = "Macro",
		["@module"]                     = { fg = util.lighten(c.fg, 0.7, c.blue) },
		["@module.builtin"]             = { fg = c.syn.special },
		["@label"]                      = { fg = c.blue },
		["@string"]                     = "String",
		["@string.special.url"]         = { fg = c.cyan, underline = true },
		["@character"]                  = "String",
		["@character.special"]          = "SpecialChar",
		["@boolean"]                    = "Boolean",
		["@number"]                     = "Number",
		["@number.float"]               = "Float",
		["@type"]                       = { fg = c.syn.type, style = opts.code_style.types },
		["@type.builtin"]               = { fg = c.syn.literal, style = opts.code_style.types },
		["@attribute"]                  = { fg = c.cyan },
		["@property"]                   = { fg = c.syn.ident },
		["@function"]                   = "Function",
		["@function.builtin"]           = { fg = c.syn.special, style = opts.code_style.functions },
		["@constructor"]                = { fg = c.syn.special },
		["@operator"]                   = "Operator",
		["@keyword"]                    = { fg = c.syn.keyword, style = opts.code_style.keywords },
		["@keyword.coroutine"]          = { fg = c.syn.keyword_mod, style = opts.code_style.keywords },
		["@keyword.function"]           = { fg = c.syn.keyword, style = opts.code_style.functions },
		-- ["@keyword.operator"]           = {},
		-- ["@keyword.import"]             = {},
		-- ["@keyword.type"]               = {},
		["@keyword.modifier"]           = { fg = c.syn.keyword_mod },
		-- ["@keyword.repeat"]             = {},
		-- ["@keyword.return"]             = {},
		-- ["@keyword.debug"]              = {},
		-- ["@keyword.exception"]          = {},
		["@keyword.conditional"]        = "Conditional",
		["@keyword.directive"]          = { fg = c.syn.keyword_mod },
		["@punctuation.delimiter"]      = { fg = c.syn.delim },
		["@punctuation.bracket"]        = { fg = c.syn.delim },
		["@punctuation.special"]        = { fg = c.syn.special },
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
		["@markup.math"]                = { fg = c.cyan },
		["@markup.link"]                = { fg = c.blue },    -- todo util
		["@markup.link.label"]          = { fg = c.orange },  -- todo util
		["@markup.link.url"]            = { underline = true }, -- todo util
		["@markup.raw"]                 = "String",
		["@markup.list"]                = "Special",
		["@markup.list.checked"]        = { fg = util.saturate(c.yellow, 0.25), bold = true },
		["@markup.list.unchecked"]      = { fg = c.fg_dark, bold = true },
		["@diff.plus"]                  = "DiffAdd",
		["@diff.minus"]                 = "DiffDelete",
		["@diff.delta"]                 = "DiffChange",
		["@tag"]                        = "Label",
		["@tag.builtin"]                = { fg = c.syn.special },
		["@tag.attribute"]              = "@property",
		["@tag.delimiter"]              = "Delimiter",

		["@comment.markdown"]           = { fg = c.comment },
		["@string.special.url.comment"] = "Comment",
	}

	return ret
end

return M
