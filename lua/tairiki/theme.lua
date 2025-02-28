local M = {}

---@param opts tairiki.Config
function M.load(opts)
  local palette = require("tairiki.palette").load(opts.palette, opts)
  local groups = require("tairiki.groups").load(opts, palette)

  if vim.g.colors_name then
    vim.cmd("hi clear")
  end

  vim.o.termguicolors = true
  vim.g.colors_name = "tairiki-" .. opts.palette

  local inherits = {}
  for group, hl in pairs(groups) do
    hl = type(hl) == "string" and { link = hl } or hl
    if hl.inherit ~= nil then
      inherits[group] = hl
    else
      vim.api.nvim_set_hl(0, group, hl)
    end
  end

  for group, hl in pairs(inherits) do
    local source_def = vim.api.nvim_get_hl(0, { name = hl.inherit, link = false })
    hl.inherit = nil
    if hl.fg then
      hl.fg = source_def.fg
    end
    if hl.bg then
      hl.bg = source_def.bg
    end
    vim.api.nvim_set_hl(0, group, hl)
  end

  if opts.terminal then
    M.load_terminal(palette)
  end
end

function M.load_terminal(palette)
  vim.g.terminal_color_0 = palette.terminal.black
  vim.g.terminal_color_8 = palette.terminal.bright_black

  vim.g.terminal_color_1 = palette.terminal.red
  vim.g.terminal_color_9 = palette.terminal.bright_red

  vim.g.terminal_color_2 = palette.terminal.green
  vim.g.terminal_color_10 = palette.terminal.bright_green

  vim.g.terminal_color_3 = palette.terminal.yellow
  vim.g.terminal_color_11 = palette.terminal.bright_yellow

  vim.g.terminal_color_4 = palette.terminal.blue
  vim.g.terminal_color_12 = palette.terminal.bright_blue

  vim.g.terminal_color_5 = palette.terminal.purple
  vim.g.terminal_color_13 = palette.terminal.bright_purple

  vim.g.terminal_color_6 = palette.terminal.cyan
  vim.g.terminal_color_14 = palette.terminal.bright_cyan

  vim.g.terminal_color_7 = palette.terminal.white
  vim.g.terminal_color_15 = palette.terminal.bright_white
end

return M
