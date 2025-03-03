local M = {}

local function inspect(t)
  local props = {}
  for k, v in pairs(t) do
    local q = type(v) == "string" and '"' or ""
    table.insert(props, string.format("%s=%s%s%s", k, q, v, q))
  end

  table.sort(props)
  return string.format("{%s}", table.concat(props, ","))
end

local term_keys = {
  "black",
  "red",
  "green",
  "yellow",
  "blue",
  "purple",
  "cyan",
  "white",
}

---@param opts tairiki.Config
function M.compile(opts)
  local colors = require("tairiki.palette").load(opts.palette, opts)
  local background = require("tairiki.palette").get_palette_bg_style(opts.palette)
  local groups = require("tairiki.groups").load(opts, colors)
  local colors_name = "tairiki-" .. opts.palette

  local lines = {
    ([[return string.dump(function()
local h = vim.api.nvim_set_hl
if vim.g.colors_name then vim.cmd("hi clear") end
vim.o.termguicolors = true
vim.o.background = "%s"
vim.g.colors_name = "%s"]]):format(background, colors_name),
  }

  if opts.terminal then
    local tc = colors.terminal
    local fmt = 'vim.g.terminal_color_%d = "%s"\nvim.g.terminal_color_%d = "%s"'
    for i, c in ipairs(term_keys) do
      table.insert(lines, fmt:format(i - 1, tc[c], i + 7, tc["bright_" .. c]))
    end
  end

  for name, hl in pairs(groups) do
    hl = type(hl) == "string" and { link = hl } or hl
    table.insert(lines, ('h(0,"%s",%s)'):format(name, inspect(hl)))
  end

  table.insert(lines, "end)")

  local outpath =
    vim.fs.joinpath(require("tairiki.util").get_compile_dir(opts), opts.palette .. "_compiled")

  -- todo real error handling
  local file, err = io.open(outpath, "wb")
  if not file then
    vim.notify(("tairiki: %s"):format(err))
    return false
  end

  local f = loadstring(table.concat(lines, "\n"), "=")
  if not f then
    vim.notify("tairiki: Unable to load compiled scheme, check config [TODO better error checking]")
    file:close()
    return false
  end

  file:write(f())
  file:close()

  return true
end

return M
