# DOTFILES - NEOTHOREN 

* List of plugins &rarr; [Here](https://github.com/rockerBOO/awesome-neovim).

* Lua-guide &rarr; [Here](https://github.com/nanotee/nvim-lua-guide).

* CMP-GUIDE &rarr; [Here](https://vonheikemen.github.io/devlog/tools/setup-nvim-lspconfig-plus-nvim-cmp/)

---

## Table of contents
- [1. Terminal](#1-terminal)
- [2. Shell](#2-shell)
  * [2.1. Theme](#21-theme)
  * [2.2. Plugins](#22-plugins)
- [3. Editor](#3-editor)
  * [3.1. Theme](#31-theme)
  * [3.2. Plugins](#32-plugins)
  * [3.3. Try out](#33-try-out)

---

## 1. Terminal

My current terminal is [iTerm2](https://github.com/gnachman/iTerm2).

---

## 2. Shell

My current shell is [zsh](https://www.zsh.org).

```
# To set zsh as default shell.
chsh -s "$(which zsh)"
```

### 2.1. Theme

My current theme is [**powerlevel10k**](https://github.com/romkatv/powerlevel10k).

### 2.2. Plugins

Here are listed my current installed plugins in the shell.

* [git](https://github.com/git/git)

* [fzf](https://github.com/junegunn/fzf)

```
# To install useful key bindings and fuzzy completion:
$(brew --prefix)/opt/fzf/install
```

* [ripgrep](https://github.com/BurntSushi/ripgrep)

* [powerlevel10k](https://github.com/romkatv/powerlevel10k)

* [node](https://github.com/nodejs/node)

* [shellcheck](https://github.com/koalaman/shellcheck)

* [ascii-image-converter](https://github.com/TheZoraiz/ascii-image-converter)

---

## 3. Editor

My current editor is [Neovim](https://github.com/neovim/neovim).

### 3.1 Theme

My current theme is [**sonokai**](https://github.com/sainnhe/sonokai).

### 3.2. Plugins

Here are listed my current installed plugins in the editor.

* [packer](https://github.com/wbthomason/packer.nvim)

* [lualine](https://github.com/nvim-lualine/lualine.nvim)

* [lspconfig](https://github.com/neovim/nvim-lspconfig)

* [lsp-installer](https://github.com/williamboman/nvim-lsp-installer)

This plugin need to be updated to https://github.com/williamboman/mason.nvim.

* [markdown-preview](https://github.com/iamcco/markdown-preview.nvim)

* [which-key](https://github.com/folke/which-key.nvim)

* [nvim-tree](https://github.com/kyazdani42/nvim-tree.lua)

* [plenary](https://github.com/nvim-lua/plenary.nvim)

* [telescope](https://github.com/nvim-telescope/telescope.nvim)

* [telescope-fzf-native](https://github.com/nvim-telescope/telescope-fzf-native.nvim)

* [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

* [image.nvim](https://github.com/samodostal/image.nvim)

* [ascii-image-converter](https://github.com/TheZoraiz/ascii-image-converter)

### 3.3. Try out

Marks:

* :star: &rarr; Will be tried first.
* :fire: &rarr; Added to current plugins.
* :x: &rarr; Tried; didn't work.

#### LSP

* https://github.com/folke/trouble.nvim :star::fire:
* https://github.com/ray-x/lsp_signature.nvim
* https://github.com/simrat39/symbols-outline.nvim :star::fire:
* https://github.com/jose-elias-alvarez/null-ls.nvim

#### Completion

* https://github.com/hrsh7th/nvim-cmp :star::fire:
* https://github.com/hrsh7th/cmp-nvim-lsp :star::fire:
* https://github.com/hrsh7th/cmp-buffer :star::fire:
* https://github.com/hrsh7th/cmp-path :star::fire:
* https://github.com/hrsh7th/cmp-cmdline :star::fire:
* https://github.com/onsails/lspkind.nvim :star::fire:

#### Syntax

* https://github.com/kylechui/nvim-surround

#### Terminal integration

* https://github.com/akinsho/toggleterm.nvim :star::fire:

#### Snippets

* https://github.com/saadparwaiz1/cmp_luasnip :star::fire:
* https://github.com/L3MON4D3/LuaSnip :star::fire:

#### Registers

* https://github.com/AckslD/nvim-neoclip.lua :star:

#### Marks

* https://github.com/ThePrimeagen/harpoon

#### Note taking

* https://github.com/nvim-neorg/neorg
* https://github.com/jbyuki/venn.nvim

#### Colors

* https://github.com/NvChad/nvim-colorizer.lua :star:
* https://github.com/sunjon/Shade.nvim :star::x:
* https://github.com/folke/twilight.nvim :star::x:
* https://github.com/folke/zen-mode.nvim

#### Debugging

* https://github.com/mfussenegger/nvim-dap
* https://github.com/rcarriga/nvim-dap-ui
* https://github.com/Pocco81/dap-buddy.nvim

#### Language

* https://github.com/lewis6991/spellsitter.nvim

#### Tabline

* https://github.com/romgrk/barbar.nvim :star:
* https://github.com/akinsho/bufferline.nvim :star:

#### Cursorline

* https://github.com/RRethy/vim-illuminate :star::x:

#### Startup

* https://github.com/glepnir/dashboard-nvim

#### Indent

* https://github.com/lukas-reineke/indent-blankline.nvim

#### Games

* https://github.com/ThePrimeagen/vim-be-good

#### Git

* https://github.com/lewis6991/gitsigns.nvim :star::fire:
* https://github.com/sindrets/diffview.nvim

#### Comment

* https://github.com/numToStr/Comment.nvim
* https://github.com/folke/todo-comments.nvim

#### Collaborative editing

* https://github.com/jbyuki/instant.nvim

#### Motion

* https://github.com/phaazon/hop.nvim :star:
* https://github.com/ggandor/lightspeed.nvim :star:

#### Code runner

* https://github.com/michaelb/sniprun

#### Github

* https://github.com/pwntester/octo.nvim

#### Scrollbar

* https://github.com/petertriho/nvim-scrollbar :star::fire:

#### Scrolling

* https://github.com/karb94/neoscroll.nvim :star:

#### Browser integration

* https://github.com/glacambre/firenvim :star:

#### Editing support

* https://github.com/windwp/nvim-autopairs :star:
* https://github.com/Pocco81/true-zen.nvim
* https://github.com/wellle/context.vim :star:
* https://github.com/bennypowers/nvim-regexplainer

#### Formatting

* https://github.com/mhartington/formatter.nvim
* https://github.com/sbdchd/neoformat

#### Session

* https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-sessions.md :star:

#### Testing

* https://github.com/nvim-neotest/neotest

#### Competitive programming

* https://github.com/xeluxee/competitest.nvim

#### Split and window

* https://github.com/sindrets/winshift.nvim :star:
* https://github.com/beauwilliams/focus.nvim 
