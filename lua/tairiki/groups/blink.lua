local M = {}

---@param c tairiki.Palette
---@param opts tairiki.Config
---@return tairiki.Highlights
function M.get(c, opts)
  -- stylua: ignore
  local ret = {
		-- BlinkCmpMenu                         = {}, -- -> Pmenu
		-- BlinkCmpMenuBorder                   = {}, -- -> Pmenu
		-- BlinkCmpMenuSelection                = {}, -- -> PmenuSel
		-- BlinkCmpScrollBarThumb               = {}, -- -> PemnuThumb
		-- BlinkCmpScrollBarGutter              = {}, -- -> PmenuSbar
		-- BlinkCmpLabel                        = {}, -- -> Pmenu
		BlinkCmpLabelDeprecated              = { fg = c.fg_dark2, strikethrough = true },
		-- BlinkCmpLabelMatch                   = {}, -- -> Pmenu
		-- BlinkCmpLabelDetail                  = {}, -- -> PmenuExtra
		-- BlinkCmpLabelDescription             = {}, -- -> PmenuExtra
		-- BlinkCmpKind                         = {}, -- -> PmenuKind
		-- BlinkCmpKind<kind>                   = {}, -- -> pmenukind
		-- BlinkCmpSource                       = {}, -- -> PmenuExtra
		BlinkCmpGhostText                    = { fg = c.fg_dark2 },
		-- BlinkCmpDoc                          = {}, -- -> NormalFloat
		-- BlinkCmpDocBorder                    = {}, -- -> NormalFloat
		-- BlinkCmpDocSeparator                 = {}, -- -> NormalFloat
		-- BlinkCmpDocCursorLine                = {}, -- -> Visual
		-- BlinkCmpSignatureHelp                = {}, -- -> NormalFloat
		-- BlinkCmpSignatureHelpBorder          = {}, -- -> NormalFloat
		-- BlinkCmpSignatureHelpActiveParameter = {}, -- -> LspSignatureActiveParameter
  }

	local kinds = require("tairiki.groups.kinds")
	kinds.set_kinds(ret, "BlinkCmpKind", opts.cmp_itemkind_reverse)
	return ret
end


return M
