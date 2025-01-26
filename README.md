<h1 align="left">
tairiki.nvim
</h1>

Dark Theme for neovim >= 0.8 based on [Tomorrow Night](https://github.com/chriskempson/tomorrow-theme).

### Features
  * Auto detection of installed plugins *(only set what you use!)*
  * Granular toggling of individual plugins *(or what you want!)*
  * Palette color, highlight group, syntax token style [customization](#customization)

### Showcase
<details open>
<!-- TODO update showcase images, or have them at all?? -->
<summary>Toggle preview</summary>

![dark_theme](https://github.com/deparr/tairiki.nvim/assets/37233002/ad842387-ad87-4f69-a2c9-8531c5b592b9)

_NOTE:_ The above image uses the rust treesitter parser for highlights

</details>

## Installation
Install via your favourite package manager
```vim
" Using Vim-Plug
Plug 'deparr/tairiki.nvim'
```

```lua
-- Using Packer
use 'deparr/tairiki.nvim'
```

```lua
-- Using lazy.nvim
{
  'deparr/tairiki.nvim',
  lazy = false,
  priority = 1000, -- recommended if you use tairiki as your default theme
  branch = "v2",
  opts = {},
}
```

## Configuration

### Default Configuration
```lua
require('tairiki').setup {
	palette              = "dark", -- main palette
	default_dark         = "dark",
	default_light        = "light",
	transparent          = false, -- don't set background colors
	terminal             = false, -- override nvim terminal colors
	end_of_buffer        = false, -- show end of buffer filler lines (tildes)
	visual_bold          = false, -- bolden visual selections
	cmp_itemkind_reverse = false, -- reverse fg/bg on nvim-cmp item kinds

	diagnostics          = {
		darker     = false, -- darken diagnostic virtual text
		background = true,  -- add background to diagnostic virtual text
		undercurl  = false, -- use undercurls for inline diagnostics
	},

	-- style for different syntactic tokens
	-- table can consist of any boolean option listed in :help nvim_set_hl()
	code_style           = {
		comments = { italic = true },
		conditionals = {},
		keywords = {},
		functions = {},
		strings = {},
		variables = {},
		parameters = {},
		types = {},
	},

	-- lualine theme config
	lualine = {
		transparent = true, -- remove background from center section
	},

	-- which plugins to enable
	plugins              = {
		all = false,  -- enable all supported plugins
		none = false, -- ONLY set groups listed in :help highlight-groups (see lua/tairiki/groups/neovim.lua). Manually enabled plugins will also be ignored
		auto = false, -- auto detect installed plugins, currently lazy.nvim only

		-- or enable/disable plugins manually
		-- see lua/tairiki/groups/init.lua for the full list of available plugins
		--	either the key or value from the M.plugins table can be used here
		--
		-- setting a specific plugin manually overrides `all` and `auto`
		treesitter = true,
		semantic_tokens = true,
	},

	-- optional function to modify or add colors to the palette
	-- palette definitions are in lua/tairiki/palette
	colors     = function(colors, opts) end,

	-- optional function to override highlight groups
	highlights = function(groups, colors, opts) end,
}
```
## Customization

Example custom colors and Highlights configuration:

```lua
require('tairiki').setup {
  -- palette definitions are in lua/tairiki/palette
  colors = function(c, opts)
    c.bright_orange = "#ff8800" -- define a new color
    c.green = '#00ffaa'         -- redefine an existing color

	if opts.palette == "light" then
		-- slightly adjust an existing color
		c.blue = require("tairiki.util").darken(c.blue, 0.1)
	end
  end,

  highlights = function(hl, c, opts)
  	hl.Number = { fg = c.red }
    hl["@keyword"] = { fg = c.green }
    hl["@string"] = { fg = c.bright_orange, bg = c.blue, bold = true }
    hl["@function"] = { fg = c.red, sp = c.cyan, underline = true, italic = true }
    hl["@function.builtin"] = { fg = '#0059ff' }
  end,
}
```

## Plugins Supported
  + [TreeSitter](https://github.com/nvim-treesitter/nvim-treesitter)
  + [NvimTree](https://github.com/kyazdani42/nvim-tree.lua)
  + [Telescope](https://github.com/nvim-telescope/telescope.nvim)
  + [WhichKey](https://github.com/folke/which-key.nvim)
  + [Dashboard](https://github.com/glepnir/dashboard-nvim)
  + [Lualine](https://github.com/hoob3rt/lualine.nvim)
  + [GitGutter](https://github.com/airblade/vim-gitgutter)
  + [GitSigns](https://github.com/lewis6991/gitsigns.nvim)
  + [VimFugitive](https://github.com/tpope/vim-fugitive)
  + [DiffView](https://github.com/sindrets/diffview.nvim)
  + [Hop](https://github.com/phaazon/hop.nvim)
  <!-- TODO + [Mini](https://github.com/echasnovski/mini.nvim) -->
  + [Neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim)
  + [Neotest](https://github.com/nvim-neotest/neotest)
  + [Barbecue](https://github.com/utilyre/barbecue.nvim)
  + ...and more! (see [the group list](lua/tairiki/groups/init.lua))

_NOTE:_ I don't use most of these, so if colors are trash, feel free to submit an issue/pr. Or use [overrides](#customization)

## Reference and Inspiration
  * [tomorrow theme](https://github.com/chriskempson/tomorrow-theme) -
	base colors
  * [onedark.nvim](https://github.com/navarasu/onedark.nvim)
  * [gruvbox](https://github.com/morhetz/gruvbox)
  * [tokyonight.nvim](https://github.com/folke/tokyonight.nvim)
  * [bamboo.nvim](https://github.com/ribru17/bamboo.nvim)

## Contributing

Pull requests are welcome 🎉👍.

## Tairiki?
Tairiki means 'evening' or 'dusk' in the [Kiribati](https://en.wikipedia.org/wiki/Kiribati) language.

