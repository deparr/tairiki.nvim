local M = {}

-- realname > modname
-- stylua: ignore
M.plugins = {
	["barbar.nvim"]             = "barbar",
	["blink.cmp"]               = "blink",
	["dashboard-nvim"]          = "dashboard",
	["diffview.nvim"]           = "diffview",
	["gitsigns.nvim"]           = "gitsigns",
	["hop.nvim"]                = "hop",
	["indent-blankline.nvim"]   = "indent_blankline",
	["mini.nvim"]               = "mini",
	["neo-tree.nvim"]           = "neotree",
	["neotest"]                 = "neotest",
	["neovim"]                  = "neovim",
	["nvim-cmp"]                = "cmp",
	["nvim-tree.lua"]           = "nvim_tree",
	["nvim-treesitter-context"] = "treesitter_context",
	["oil.nvim"]                = "oil",
	["rainbow-delimiters.nvim"] = "rainbow_delimiters",
	["semantic-tokens"]         = "semantic_tokens",
	["telescope.nvim"]          = "telescope",
	["treesitter"]              = "treesitter",
	["vim-fugitive"]            = "fugitive",
	["vim-gitgutter"]           = "gitgutter",
	["which-key.nvim"]          = "which_key",
}

function M.flatten_styles(groups)
  for _, hl in pairs(groups) do
    if type(hl.style) == "table" then
      for s, v in pairs(hl.style) do
        hl[s] = v
      end
      hl.style = nil
    end
  end
end

function M.load(opts, colors)
  local groups = {
    neovim = true,
  }

  if not opts.plugins.none then
    if opts.plugins.all then
      for _, module in pairs(M.plugins) do
        groups[module] = true
      end
    elseif opts.plugins.auto then
      if package.loaded.lazy then
        local names = vim.tbl_keys(require("lazy.core.config").plugins)
        for _, plugin in ipairs(names) do
          if M.plugins[plugin] then
            groups[M.plugins[plugin]] = true
          end
        end
      else
        vim.notify(
          "tairiki.nvim: lazy.nvim not loaded, can't auto discover plugins",
          vim.log.levels.WARN
        )
      end
    end

    for plugin, module in pairs(M.plugins) do
      local cfg = opts.plugins[plugin]
      if cfg == nil then
        cfg = opts.plugins[module]
      end
      if cfg ~= nil then
        if type(cfg) == "table" then
          cfg = cfg.enabled
        end
        groups[module] = cfg
      end
    end
  end

  local ret = {}
  for group, enabled in pairs(groups) do
    if enabled then
      local ok, groupmod = pcall(require, "tairiki.groups." .. group)
      if ok and type(groupmod) == "table" then
        for g, hl in pairs(groupmod.get(colors, opts)) do
          ret[g] = hl
        end
      else
        vim.notify(
          "tairiki.nvim: failed to load group module tairiki.groups." .. group,
          vim.log.levels.WARN
        )
      end
    end
  end

  if colors.highlights then
    ret = vim.tbl_extend("force", ret, colors.highlights)
  end

  if opts.highlights then
    opts.highlights(ret, colors, opts)
  end

  M.flatten_styles(ret)

  return ret
end

return M
