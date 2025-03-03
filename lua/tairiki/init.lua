local config = require("tairiki.config")

local M = {}

M.palette = {}

M.setup = config.setup

function M.load(opts)
  opts = config.extend(opts)
  local palette_bg_style = require("tairiki.palette").get_palette_bg_style(opts.palette)

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
