local config = require("tairiki.config")

local M = {}

M.palette = {}

---@param opts? tairiki.Config
function M.setup(opts)
  ---@diagnostic disable-next-line:undefined-field
  if opts and opts.ending_tildes then
    opts.end_of_buffer = opts.ending_tildes ---@diagnostic disable-line:undefined-field
  end

  config.options = vim.tbl_deep_extend("force", {}, config.defaults, opts or {})

  if not config.options.compile.enable then
    return
  end

  local cached_path =
    vim.fs.joinpath(require("tairiki.util").get_compile_dir(config.options), "cache")
  local cached = nil
  local file = io.open(cached_path)
  if file then
    cached = file:read()
    file:close()
  end

  local git_path = vim.fs.joinpath(debug.getinfo(1).source:sub(2, -22) .. "/.git")
  local git = vim.fn.getftime(git_path)
  local hash = require("tairiki.util.hash").hash_conf(opts) .. (git == -1 and git_path or git)

  if cached ~= hash then
    M.compile()
    file = io.open(cached_path, "wb")
    if file then
      file:write(hash)
      file:close()
    end
  end
end

function M.load(opts)
  opts = config.extend(opts)
  local palette_bg_style = require("tairiki.palette").get_palette_bg_style(opts.palette)

  -- todo this doesn't always get the correct palette, though only on user registered palettes
  if vim.o.background ~= palette_bg_style then
    -- if background doesn't match and we're already on this palette, swap background
    if vim.g.colors_name == "tairiki-" .. opts.palette then
      -- use user defined default palettes
      opts.palette = vim.o.background == "light" and (M.palette.light or opts.default_light)
        or (M.palette.dark or opts.default_dark)
    else
      -- otherwise we should swap background to our palette's style
      vim.o.background = palette_bg_style
    end
  end
  M.palette[vim.o.background] = opts.palette

  if not opts.compile.enable then
    M.load_non_compile(opts)
    return
  end

  local compiled_file =
    vim.fs.joinpath(require("tairiki.util").get_compile_dir(opts), opts.palette .. "_compiled")
  local f = loadfile(compiled_file)
  if not f then
    M.compile()
    f = loadfile(compiled_file)
  end

  ---@diagnostic disable-next-line: need-check-nil
  f()
end

function M.compile()
  vim.g.tairiki_compiled = true
  local compiler = require("tairiki.compiler")
  local opts = config.extend({})
  for _, palette in ipairs(vim.tbl_keys(require("tairiki.palette").palettes)) do
    opts.palette = palette
    compiler.compile(opts)
  end
end

function M.load_non_compile(opts)
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end
  vim.o.termguicolors = true
  vim.g.colors_name = "tairiki-" .. opts.palette

  local colors = require("tairiki.palette").load(opts.palette, opts)
  local groups = require("tairiki.groups").load(opts, colors)
  local h = vim.api.nvim_set_hl
  for name, hl in pairs(groups) do
    hl = type(hl) == "string" and { link = hl }  or hl
    h(0, name, hl)
  end

  if opts.terminal then
    vim.g.terminal_color_0 = colors.terminal.black
    vim.g.terminal_color_8 = colors.terminal.bright_black
    vim.g.terminal_color_1 = colors.terminal.red
    vim.g.terminal_color_9 = colors.terminal.bright_red
    vim.g.terminal_color_2 = colors.terminal.green
    vim.g.terminal_color_10 = colors.terminal.bright_green
    vim.g.terminal_color_3 = colors.terminal.yellow
    vim.g.terminal_color_11 = colors.terminal.bright_yellow
    vim.g.terminal_color_4 = colors.terminal.blue
    vim.g.terminal_color_12 = colors.terminal.bright_blue
    vim.g.terminal_color_5 = colors.terminal.purple
    vim.g.terminal_color_13 = colors.terminal.bright_purpke
    vim.g.terminal_color_6 = colors.terminal.cyan
    vim.g.terminal_color_14 = colors.terminal.bright_cyan
    vim.g.terminal_color_7 = colors.terminal.white
    vim.g.terminal_color_15 = colors.terminal.bright_white
  end
end

return M
