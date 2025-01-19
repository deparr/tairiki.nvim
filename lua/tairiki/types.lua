---@class tairiki.Highlight: vim.api.keyset.highlight
---@field style? vim.api.keyset.highlight

---@alias tairiki.Highlights table<string,tairiki.Highlight|string>

---@alias tairiki.HighlightsFn fun(colors: ColorScheme, opts:tairiki.Config):tairiki.Highlights

---@class tairiki.Cache
---@field groups tairiki.Highlights
---@field inputs table

