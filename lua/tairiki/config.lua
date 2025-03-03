local M = {}

---@alias tairiki.Config.ColorExtFunc
---| fun(colors: tairiki.Palette, opts: tairiki.Config)

---@alias tairiki.Config.HighlightExtFunc
---| fun(highlights: table<string, tairiki.Highlight>, colors: tairiki.Palette, opts: tairiki.Config)

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

---@param old_config? table
--- migrates an old config to a tairiki.Config
function M.migrate_config(old_config)
  if not old_config then
    return
  end

  if type(old_config.style) == "string" then
    old_config.palette = old_config.style
    old_config.style = nil
  end

  if type(old_config.term_colors) == "boolean" then
    old_config.terminal = old_config.term_colors
    old_config.term_colors = nil
  end

  if type(old_config.ending_tildes) == "boolean" then
    old_config.end_of_buffer = old_config.ending_tildes
    old_config.ending_tildes = nil
  end

  if type(old_config.code_style) == "table" then
    for k, s in pairs(old_config.code_style) do
      if type(s) == "string" then
        local st = {}
        if s ~= "none" then
          for _, sk in ipairs(vim.split(s, "%s*,%s*")) do
            st[sk] = true
          end
        end
        old_config.code_style[k] = st
      end
    end
  end

  old_config.toggle_style_key = nil
  old_config.toggle_style_list = nil

  local found = false
  if type(old_config.colors) == "table" then
    old_config.colors = nil
    found = true
  end
  if type(old_config.highlights) == "table" then
    old_config.highlights = nil
    found = true
  end
  if found then
    vim.schedule(function()
      vim.notify(
        "tairiki: found old-style color or highlight overrides, see default config on how to migrate",
        vim.log.levels.WARN
      )
    end)
  end
end

---@param opts? tairiki.Config
function M.setup(opts)
  M.migrate_config(opts)
  M.options = vim.tbl_deep_extend("force", {}, M.defaults, opts or {})
end

---@param opts? tairiki.Config
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
