local M = {}

-- TODO a lot of these end up the same, which is _probably_ fine
M.kinds = {
  Text = "Pmenu",
  Method = "Function",
  Function = "Function",
  Constructor = "Type",
  Field = "@property",
  Variable = "Identifier",
  Class = "Type",
  Interface = "Typedef",
  Module = "@module",
  Property = "@property",
  Unit = "Type",
  Value = "Number",
  Enum = "Type",
  Keyword = "Keyword",
  Snippet = "Macro",
  Color = "@attribute",
  File = "Pmenu",
  Reference = "Pmenu",
  Folder = "Directory",
  EnumMember = "Constant",
  Constant = "Constant",
  Struct = "Structure",
  Event = "PreProc",
  Operator = "Operator",
  TypeParameter = "Type",
}

---@param hl tairiki.Highlights table to insert item kind hls to
---@param prefix string optional prefix for item kinds
---@param reverse boolean whether to invert highlight fg/bg
---@return tairiki.Highlights : updated `hl` table
function M.set_kinds(hl, prefix, reverse)
  prefix = prefix or ""
  for kind, source in pairs(M.kinds) do
    hl[prefix .. kind] = { inherit = source, fg = "", reverse = reverse }
  end
  return hl
end

return M
