local M = {}

---@alias tairiki.Config.ColorExtFunc
---| fun(colors: tairiki.Palette, opts: tairiki.Config)

---@alias tairiki.Config.HighlightExtFunc
---| fun(highlights: table<string, tairiki.Highlight>, colors: tairiki.Palette, opts: tairiki.Config)

---@class tairiki.Config
M.defaults = {
	palette = "dark",
	default_dark = "dark",
	default_light = "light",
	transparent = false,
	terminal = false,
	end_of_buffer = false,
	visual_bold = false,
	cmp_itemkind_reverse = false,
	-- palette change key ??
	diagnostics = {
		darker = false,
		background = true,
		undercurl = false,
	},
	---@type table<string, table<string, boolean>>
	code_style = {
		comments = { italic = true },
		conditionals = {},
		keywords = {},
		functions = {},
		strings = {},
		variables = {},
		types = {},
	},
	---@type table<string, boolean|{enabled: boolean}>
	plugins = {
		all = false,
		none = false, -- when true, will ONLY set groups listed in :help highlight-groups (lua/groups/neovim.lua)
		auto = false, -- auto detect installed plugins
		treesitter = true,
		semantic_tokens = true,
	},
	---@type tairiki.Config.ColorExtFunc?
	colors = nil,

	---@type tairiki.Config.HighlightExtFunc?
	highlights = nil
}

---@type tairiki.Config
M.options = nil

---@param opts? tairiki.Config
function M.setup(opts)
	---@diagnostic disable-next-line:undefined-field
	if opts and opts.ending_tildes then
		opts.end_of_buffer = opts.ending_tildes ---@diagnostic disable-line:undefined-field
	end

	M.options = vim.tbl_deep_extend("force", {}, M.defaults, opts or {})
	if M.options.default_dark == nil then
		M.options.default_dark = "dark"
	end
	if M.options.default_light == nil then
		M.options.default_light = "light"
	end
end

---@param opts? tairiki.Config
function M.extend(opts)
	return opts and vim.tbl_deep_extend("force", {}, M.options, opts) or M.options
end

setmetatable(M, {
	__index = function(_, k)
		if k == "options" then
			return M.defaults
		end
	end
})

return M
