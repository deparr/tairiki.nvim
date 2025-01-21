local M = {
	---@type table<string, tairiki.Palette>
	palettes = {}
}

-- TODO NONE
---@class tairiki.Palette
---@field bg string
---@field fg string
---@field bg_light? string
---@field bg_light2? string
---@field bg_light3? string
---@field fg_dark? string
---@field fg_dark2? string
---@field fg_dark3? string
---@field purple string
---@field green string
---@field orange string
---@field blue string
---@field yellow string
---@field cyan string
---@field red string
---@field comment string
---@field diag? tairiki.Palette.Diagnostic
---@field diff? tairiki.Palette.Diff
---@field syn? tairiki.Palette.Syntax
---@field x? table<string, string>
---@field group_x? fun(self: tairiki.Palette): table<string, table<string, string|tairiki.Highlights>>

---@class tairiki.Palette.Diagnostic
---@field error? string
---@field info? string
---@field warn? string
---@field hint? string
---@field ok? string

---@class tairiki.Palette.Diff
---@field add? string
---@field remove? string
---@field change? string
---@field text? string

---@class tairiki.Palette.Syntax
---@field ident? string
---@field constant? string
---@field literal? string
---@field func? string
---@field string? string
---@field type? string
---@field keyword? string
---@field keyword_mod? string
---@field special? string
---@field delim? string
---@field exception? string
---@field operator? string

-- todo builtin palettes should also properly register themselves
M.palettes.dimmed = require "tairiki.palette.dimmed"
M.palettes.dark = require "tairiki.palette.dark"
M.palettes.light = require "tairiki.palette.light"

---@param which string
function M.load(which)
	-- todo rethink this
	return M.palettes[which]
end

return M
