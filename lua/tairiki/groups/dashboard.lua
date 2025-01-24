local M = {}

---@param c tairiki.Palette
---@param opts tairiki.Config
---@return tairiki.Highlights
function M.get(c, opts)
	return {
		DashboardDesc             = { fg = c.fg_dark },
		DashboardFiles            = { fg = c.fg_dark2 },
		DashboardFooter           = { fg = c.fg_dark3 },
		DashboardHeader           = { fg = c.syn.literal },
		DashboardIcon             = { fg = c.red },
		DashboardKey              = { fg = c.syn.literal },
		DashboardMruIcon          = { fg = c.red },
		DashboardMruTitle         = { fg = c.red },
		DashboardProjectIcon      = { fg = c.fg_dark },
		DashboardProjectTitle     = { fg = c.orange },
		DashboardProjectTitleIcon = { fg = c.orange },
		DashboardShortCut         = { fg = c.fg_dark3 },
		DashboardShortCutIcon     = { fg = c.fg_dark },
	}
end

return M
