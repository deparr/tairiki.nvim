local M = {}

---@param c tairiki.Palette
---@param opts tairiki.Config
---@return tairiki.Highlights
function M.get(c, opts)
	return {
		DiffviewFilePanelTitle      = { fg = c.purple },
		DiffviewFilePanelCounter    = { fg = c.orange },
		DiffviewFilePanelFileName   = { fg = c.fg_dark },
		DiffviewNormal              = "Normal",
		DiffviewCursorLine          = "CursorLine",
		DiffviewVertSplit           = "VertSplit",
		DiffviewSignColumn          = "SignColumn",
		DiffviewStatusLine          = "StatusLine",
		DiffviewStatusLineNC        = "StatusLineNC",
		DiffviewEndOfBuffer         = "EndOfBuffer",
		DiffviewFilePanelRootPath   = { fg = c.fg_dark },
		DiffviewFilePanelPath       = { fg = c.fg_dark },
		DiffviewFilePanelInsertions = { fg = c.green },
		DiffviewFilePanelDeletions  = { fg = c.red },
		DiffviewFolderSign          = { fg = c.blue },
		DiffviewStatusAdded         = { fg = c.green },
		DiffviewStatusUntracked     = { fg = c.red },
		DiffviewStatusModified      = { fg = c.orange },
		DiffviewStatusRenamed       = { fg = c.orange },
		DiffviewStatusCopied        = { fg = c.orange },
		DiffviewStatusTypeChange    = { fg = c.orange },
		DiffviewStatusUnmerged      = { fg = c.blue },
		DiffviewStatusUnknown       = { fg = c.red },
		DiffviewStatusDeleted       = { fg = c.red },
		DiffviewStatusBroken        = { fg = c.red },
	}
end

return M
