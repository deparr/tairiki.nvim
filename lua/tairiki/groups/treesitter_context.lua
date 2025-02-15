local M = {}

---@param c tairiki.Palette
---@param opts tairiki.Config
---@return tairiki.Highlights
function M.get(c, opts)
  -- stylua: ignore
  return {
		-- TreesitterContext                 = {}, -> NormalFloat
		TreesitterContextLineNumber          = { fg = c.fg, bg = c.bg_light },
		-- TreesitterContextSeparator        = {}, -> FloatBorder
		-- TreesitterContextBottom           = {},
		-- TreesitterContextLineNumberBottom = {},
	}
end

return M
