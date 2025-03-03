<h1 align="left">
tairiki.nvim
</h1>

Dark Theme for neovim >= 0.8 based on [Tomorrow Night](https://github.com/chriskempson/tomorrow-theme).

### Features
  * Auto detection of installed plugins *(only set what you use!)*
  * Granular toggling of individual plugins *(or what you want!)*
  * Palette color, highlight group, syntax token style [customization](#customization)
  * [Config compilation](#compilation) for faster startup time

### Showcase
> [!NOTE]
> All screenshots were taken with `plugins = { auto = true }` (ie `treesitter` and `semantic_tokens` groups are used).
<details open>
<summary>Toggle dark theme preview</summary>

![tairiki-dark](https://github.com/user-attachments/assets/a0ab1738-6afe-41d8-900b-c7fdfb880b55)

</details>
<details closed>
<summary>Toggle light theme preview</summary>

![tairiki-light](https://github.com/user-attachments/assets/c0a14657-fa3a-47a5-9942-3aa028169224)

</details>
<details closed>
<summary>Toggle dimmed theme preview</summary>

![tairiki-dimmed](https://github.com/user-attachments/assets/61fe5d55-d019-463d-999c-6ed4584381f0)

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
  palette              = "dark", -- main palette, available options: dark, light, dimmed, tomorrow, light_legacy
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
  -- see :help nvim_set_hl() for available keys
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

  compile = {
      enable = true, -- use compilation feature, see #Compilation below
      path = vim.fn.stdpath("cache"), -- store compiled theme files here
  }

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
    -- either the key or value from the M.plugins table can be used here
    --
    -- setting a specific plugin manually overrides `all` and `auto`
    treesitter = true,
    semantic_tokens = true,
  },

  -- optional function to modify or add colors to the palette
  -- palette definitions are in lua/tairiki/palette.
  ---@type fun(tairiki.Palette, tairiki.Config): tairiki.Palette?
  colors     = function(colors, opts) end,

  -- optional function to override highlight groups
  ---@type fun(tairiki.Palette, tairiki.Config): table<string, highlight>?
  highlights = function(colors, opts) end,
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

    return c
  end,

  highlights = function(c, opts)
    return {
      Number = { fg = c.red },
      ["@keyword"] = { fg = c.green },
      ["@string"] = { fg = c.bright_orange, bg = c.blue, bold = true },
      ["@function"] = { fg = c.red, sp = c.cyan, underline = true, italic = true },
      ["@function.builtin"] = { fg = '#0059ff' },
    }
  end,
}
```

## Compilation
Tairiki can store the lua bytecode of your customized theme and regenerate
this bytecode when your config is changed.

> [!TIP]
> There is not a substantial performance difference between compilation
> and rebuilding the groups each time unless you have a lot of plugin
> group sets enabled. 

By default, these files are stored in `vim.fn.stdpath("cache") .. "/tairiki"`,
but this path can be specified with the `config.compile.path` option.
Note that tairiki will create a `/tairiki` subdirectory in the given path.

To disable compilation entirely set:
```lua
opts = {
  compile = {
     enabled = false,
  }
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

