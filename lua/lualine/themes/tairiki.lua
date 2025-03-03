local opts = require("tairiki.config").options
local p = require("tairiki").palette[vim.o.background] or opts.palette
local c = require("tairiki.palette").load(p)

return {
  inactive = {
    a = { fg = c.fg_dark, bg = c.bg, gui = "bold" },
    b = { fg = c.fg_dark, bg = c.bg },
    c = { fg = c.fg_dark, bg = opts.lualine.transparent and c.none or c.bg_light },
  },
  normal = {
    a = { fg = c.fg_dark, bg = c.bg_light2, gui = "bold" },
    b = { fg = c.fg, bg = c.bg_light },
    c = { fg = c.fg, bg = opts.lualine.transparent and c.none or c.bg_light },
  },
  visual = { a = { fg = c.purple, bg = c.bg_light2, gui = "bold" } },
  replace = { a = { fg = c.red, bg = c.bg_light2, gui = "bold" } },
  insert = { a = { fg = c.green, bg = c.bg_light2, gui = "bold" } },
  command = { a = { fg = c.orange, bg = c.bg_light2, gui = "bold" } },
  terminal = { a = { fg = c.yellow, bg = c.bg_light2, gui = "bold" } },
}
