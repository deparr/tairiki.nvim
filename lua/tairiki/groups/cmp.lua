local M = {}

---@param c tairiki.Palette
---@param opts tairiki.Config
---@return tairiki.Highlights
function M.get(c, opts)
  -- stylua: ignore
  local ret = {
    CmpItemAbbr = { fg = c.fg },
    CmpItemAbbrDeprecated = { fg = c.red, strikethrough = true },
    CmpItemAbbrMatch = { fg = c.cyan },
    -- CmpItemKind = {
    --   fg = c.purple,
    --   reverse = opts.cmp_itemkind_reverse,
    -- },
  }
  local kinds = require("tairiki.groups.kinds")
  kinds.set_kinds(ret, "CmpItemKind", opts.cmp_itemkind_reverse)
  return ret
end

return M
