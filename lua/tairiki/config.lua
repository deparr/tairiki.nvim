local M = {}


---@class tairiki.Config
M.defaults = {
	palette = "dark",
	transparent = false,
	terminal = false,
	end_of_buffer = false,
	-- cmp_itemkind_reverse
	-- visual_bold
	-- palette change key ??
	diagnostics = {
		darker = false,
		background = true,
		undercurl = false,
	},
	---@type table<string, boolean|{enabled: boolean}>
	plugins = {
		-- default groups are neovim, treesitter, and semantic_tokens
		-- palette overrides still apply, even for disabled plugins
		all = false,
		none = false, -- when true, will ONLY set groups listed in :help highlight-groups (groups/neovim.lua)
		auto = false,
		treesitter = true, -- ':help treesitter-highlight-groups' and groups/treesitter.lua
		semantic_tokens= true, -- ':help lsp-semantic-highlight' and groups/semantic_tokens.lua
	}
	-- code_style ??
}

---@type tairiki.Config
M.options = nil

---@param options? tairiki.Config
function M.setup(options)
  M.options = vim.tbl_deep_extend("force", {}, M.defaults, options or {})
end

---@param opts? tairiki.Config
function M.extend(opts)
  return opts and vim.tbl_deep_extend("force", {}, M.options, opts) or M.options
end

-- dont allow options to be directly manipulated
-- although this allows the defaults to be changed...
-- todo make this read only
setmetatable(M, {
  __index = function(_, k)
    if k == "options" then
      return M.defaults
    end
  end,
})


return M
