local util = require("tairiki.util")
local M = {}

---@param c tairiki.Palette
---@param opts tairiki.Config
---@return tairiki.Highlights
function M.get(c, opts)
	local darker_grey = util.darken(c.fg_dark3, 0.1, c.bg)
	return {
		-- todo these probably shouldn't be defined here
		RainbowRed                      = { fg = c.red },
		RainbowOrange                   = { fg = c.orange },
		RainbowYellow                   = { fg = c.yellow },
		RainbowGreen                    = { fg = c.green },
		RainbowBlue                     = { fg = c.blue },
		RainbowCyan                     = { fg = c.cyan },
		RainbowViolet                   = { fg = c.purple },
		IndentBlanklineChar             = { fg = c.bg, nocombine = true },
		IndentBlanklineContextChar      = { fg = darker_grey, nocombine = true },
		IndentBlanklineContextStart     = { sp = darker_grey, underline = true },
		IndentBlanklineContextSpaceChar = { nocombine = true },
	}
end

return M
