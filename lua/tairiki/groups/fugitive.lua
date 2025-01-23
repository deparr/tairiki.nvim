local util = require("tairiki.util")
local M = {}

---@param c tairiki.Palette
---@param opts tairiki.Config
---@return tairiki.Highlights
function M.get(c, opts)
	return {
		fugitiveHeader            = { fg = c.fg_dark2 },
		fugitiveSection           = { fg = c.fg_dark },
		fugitiveUntrackedSection  = "fugitiveSection",
		fugitiveUnstagedSection   = "fugitiveSection",
		fugitiveStagedSection     = "fugitiveSection",
		fugitiveHeading           = { fg = c.purple },
		fugitiveUnstagedHeading   = "fugitiveHeading",
		fugitiveUntrackedHeading  = "fugitiveHeading",
		fugitiveStagedHeading     = "fugitiveHeading",
		fugitiveUntrackedModifier = { fg = c.red },
		fugitiveUnstagedModifier  = { fg = c.orange },
		fugitiveStagedModifier    = { fg = c.orange },
		fugitiveSymbolicRef       = { fg = c.green },
		fugitiveHash              = { fg = util.blend(c.yellow, c.bg, 0.8) },
		fugitiveHelpTag           = { fg = c.blue },
	}
end

return M
