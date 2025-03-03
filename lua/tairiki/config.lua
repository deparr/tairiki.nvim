local M = {}

---@alias tairiki.Config.ColorExtFunc
---| fun(colors: tairiki.Palette, opts: tairiki.Config): tairiki.Palette

---@alias tairiki.Config.HighlightExtFunc
---| fun(colors: tairiki.Palette, opts: tairiki.Config): tairiki.Highlights

---@class tairiki.Config
M.defaults = {
  palette = "dark",
  default_dark = "dark",
  default_light = "light",
  transparent = false,
  terminal = false,
  end_of_buffer = false,
  visual_bold = false,
  cmp_itemkind_reverse = false,
  diagnostics = {
    darker = false,
    background = true,
    undercurl = true,
  },
  ---@type table<string, table<string, boolean>>
  code_style = {
    comments = { italic = true },
    conditionals = {},
    keywords = {},
    functions = {},
    strings = {},
    variables = {},
    parameters = {},
    types = {},
  },
  ---@type table<string, boolean|{enabled: boolean}>
  plugins = {
    all = false,
    none = false, -- when true, will ONLY set groups listed in :help highlight-groups (lua/groups/neovim.lua)
    auto = false, -- auto detect installed plugins
    treesitter = true,
    semantic_tokens = true,
  },

  compile = {
    enable = true,
    path = vim.fn.stdpath("cache"),
  },

	---@type {transparent: boolean}?
  lualine = {
    transparent = false,
  },

  ---@type tairiki.Config.ColorExtFunc?
  colors = nil,

  ---@type tairiki.Config.HighlightExtFunc?
  highlights = nil,
}

---@type tairiki.Config
M.options = nil

---@param opts? tairiki.Config|{}
function M.extend(opts)
  return opts and vim.tbl_deep_extend("force", {}, M.options, opts) or M.options
end

setmetatable(M, {
  __index = function(_, k)
    if k == "options" then
      return M.defaults
    end
  end,
})

return M
