<h1 align="left">
tairiki.nvim
</h1>

Dark Theme for neovim >= 0.8 based on [Tomorrow Night](https://github.com/chriskempson/tomorrow-theme) and forked from [Onedark.nvim](https://github.com/navarasu/onedark.nvim). Theme written in lua with [TreeSitter](https://github.com/nvim-treesitter/nvim-treesitter) syntax highlighting.

*For latest [TreeSitter](https://github.com/nvim-treesitter/nvim-treesitter) syntax highlight, upgraded to Neovim 0.8.0 or later built with tree-sitter 0.20.3+*

> Disclaimer: I wrote this colorscheme for myself and don't really expect others to use it. There's probably broken / bad highlights everywhere, especially in langs I don't use.

### Features
  * TODO: re-write these
  * Supporting multiple plugins with hand picked proper colors
  * Customize `Colors`, `Highlights` and `Code style` of the theme as you like (Refer [Customization](#customization))
  * Toggle the theme style without exiting Neovim using `toggle_style_key` (Refer [Config](#default-configuration)) TODO: maybe add more styles

### Showcase
<details open>
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
  priority = 1000,
  config = function()
    require('tairiki').setup {
      -- optional configuration here
    }
    require('tairiki').load()
  end,
}
```

## Configuration

### Enable theme

```lua
-- Lua
require('tairiki').load()
```

```vim
" Vim
colorscheme tairiki
```

### Change style

```lua
-- Lua
require('tairiki').setup {
    style = 'dark'
}
require('tairiki').load()
```

```vim
" Vim
let g:tairiki_config = {
    \ 'style': 'dark',
\}
colorscheme tairiki
```

### Full Configuration

```lua
-- Lua
require('tairiki').setup  {
    -- Main options --
    style = 'dark', -- Default theme style. Choose between 'dark' (more styles on the way)
    transparent = false,  -- Show/hide background
    term_colors = true, -- Change terminal color as per the selected theme style
    ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
    cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

    -- toggle theme style ---
    toggle_style_key = nil, -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
    toggle_style_list = {'dark'}, -- List of styles to toggle between TODO

    -- Change code style ---
    -- Options are italic, bold, underline, none
    -- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
    code_style = {
        comments = 'italic',
        keywords = 'none',
        functions = 'none',
        strings = 'none',
        variables = 'none'
    },

    -- Lualine options --
    lualine = {
        transparent = false, -- lualine center bar transparency
    },

    -- Custom Highlights --
    colors = {}, -- Override default colors
    highlights = {}, -- Override highlight groups

    -- Plugins Config --
    diagnostics = {
        darker = true, -- darker colors for diagnostic
        undercurl = true,   -- use undercurl instead of underline for diagnostics
        background = true,    -- use background color for virtual text
    },
}
```

### Vimscript configuration

Tairiki can be configured also with Vimscript, using the global dictionary `g:tairiki_config`.
**NOTE**: when setting boolean values use `v:true` and `v:false` instead of 0 and 1

Example:
```vim
let g:tairiki_config = {
  \ 'style': 'deep',
  \ 'toggle_style_key': '<leader>ts',
  \ 'ending_tildes': v:true,
  \ 'diagnostics': {
    \ 'darker': v:false,
    \ 'background': v:false,
  \ },
\ }
colorscheme tairiki
```

## Customization

Example custom colors and Highlights config
Existing colors can be found [here](https://github.com/deparr/tairiki.nvim/blob/master/lua/tairiki/palette.lua).

```lua
require('tairiki').setup {
  colors = {
    bright_orange = "#ff8800",    -- define a new color
    green = '#00ffaa',            -- redefine an existing color
  },
  highlights = {
    ["@keyword"] = {fg = '$green'},
    ["@string"] = {fg = '$bright_orange', bg = '#00ff00', fmt = 'bold'},
    ["@function"] = {fg = '#0000ff', sp = '$cyan', fmt = 'underline,italic'},
    ["@function.builtin"] = {fg = '#0059ff'}
  }
}
```
Note that TreeSitter keywords were changed in neovim version `0.8.0`.
This theme uses the new highlight keywords. All TreeSitter highlights this theme sets can be viewed [here](https://github.com/deparr/tairiki.nvim/blob/master/lua/tairiki/highlights.lua#L141-L230)

## Plugins Configuration

### Enable lualine
To Enable the `tairiki` theme for `Lualine`, specify theme as `tairiki`:

```lua
require('lualine').setup {
  options = {
    theme = 'tairiki'
    -- ... your lualine config
  }
}
```

## Plugins Supported
  + TODO check these
  + [TreeSitter](https://github.com/nvim-treesitter/nvim-treesitter)
  + [LSPDiagnostics](https://neovim.io/doc/user/lsp.html)
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
  + [Mini](https://github.com/echasnovski/mini.nvim)
  + [Neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim)
  + [Neotest](https://github.com/nvim-neotest/neotest)
  + [Barbecue](https://github.com/utilyre/barbecue.nvim)

## Reference
  * [onedark.nvim](https://github.com/navarasu/onedark.nvim)
  * [tomorrow theme](https://github.com/chriskempson/tomorrow-theme)
  * [gruvbox](https://github.com/morhetz/gruvbox)
  * [tokyonight.nvim](https://github.com/folke/tokyonight.nvim)
  * [bamboo.nvim](https://github.com/ribru17/bamboo.nvim)

## Contributing

Pull requests are welcome 🎉👍.

## Tairiki?
Tairiki means 'evening' or 'dusk' in the [Kiribati](https://en.wikipedia.org/wiki/Kiribati) language.


## License

[MIT](https://choosealicense.com/licenses/mit/)
