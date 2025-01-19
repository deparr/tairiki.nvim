---@type table<string, tairiki.Palette>
local M = {}

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
---@field diag tairiki.Palette.Diagnostic
---@field diff tairiki.Palette.Diff
---@field syn tairiki.Palette.Syntax

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

-- todo builtin palettes should also register themselves
M.dimmed = require "tairiki.palette.dimmed"
M.dark = require "tairiki.palette.dark"
M.light = require "tairiki.palette.light"

return M
