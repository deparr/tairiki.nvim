local c = require("tairiki.colors")
local cfg = vim.g.tairiki_config

local tairiki = {
  inactive = {
    a = { fg = c.grey, bg = c.bg, gui = "bold" },
    b = { fg = c.grey, bg = c.bg },
    c = { fg = c.grey, bg = cfg.lualine.transparent and c.none or c.bg1 },
  },
  normal = {
    a = { fg = c.light_grey, bg = c.bg2, gui = "bold" },
    b = { fg = c.fg, bg = c.bg1 },
    c = { fg = c.fg, bg = cfg.lualine.transparent and c.none or c.bg1 },
  },
  visual = { a = { fg = c.purple, bg = c.bg2, gui = "bold" } },
  replace = { a = { fg = c.red, bg = c.bg2, gui = "bold" } },
  insert = { a = { fg = c.blue, bg = c.bg2, gui = "bold" } },
  command = { a = { fg = c.orange, bg = c.bg2, gui = "bold" } },
  terminal = { a = { fg = c.cyan, bg = c.bg2, gui = "bold" } },
}
return tairiki
