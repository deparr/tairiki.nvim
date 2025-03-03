local opts = require("tairiki.config").options
require("tairiki").load({
  palette = vim.o.background == "light" and opts.default_light or opts.default_dark,
})
