# DOTFILES - NEOTHOREN 

* List of plugins &rarr; [Here](https://github.com/rockerBOO/awesome-neovim).

* Lua-guide &rarr; [Here](https://github.com/nanotee/nvim-lua-guide).

* CMP-GUIDE &rarr; [Here](https://vonheikemen.github.io/devlog/tools/setup-nvim-lspconfig-plus-nvim-cmp/)

---

## Table of contents
- [0. OS](#0-os)
- [1. Terminal](#1-terminal)
- [2. Shell](#2-shell)
  * [2.1. Plugins](#21-plugins)
  * [2.2. Try out](#22-try-out)
- [3. Editor](#3-editor)
  * [3.1. Theme](#31-theme)
  * [3.2. Plugins](#32-plugins)
  * [3.3. Try out](#33-try-out)

---

## 0. OS

I use [Vimac](https://github.com/dexterleng/vimac) to move trough the system.

### 0.1 Plugins

Here are listed my current installed plugins in the os.

* [yabai](https://github.com/koekeishiya/yabai)

* [skhd](https://github.com/koekeishiya/skhd)

* [sketchyBar](https://github.com/FelixKratz/SketchyBar)

### 0.2 Try out

---

## 1. Terminal

My current terminal is [**Alacritty**](https://github.com/alacritty/alacritty). It is cross-platform, so +1 for MacOS,
Linux and Windows.

My old terminal was [**iTerm2**](https://github.com/gnachman/iTerm2), but Alacritty improves the performance, which is what I care more of.

---

## 2. Shell

My current shell is [**nushell**](https://github.com/nushell/nushell) and prompt is [**starship**](https://github.com/starship/starship).

```
#To set nu as the default shell:
echo $(which nu) | sudo tee -a /etc/shells
chsh -s $(which nu)
```

### 2.1. Plugins

Here are listed my current installed plugins in the shell.

* [git](https://github.com/git/git)

* [fzf](https://github.com/junegunn/fzf)

* [ripgrep](https://github.com/BurntSushi/ripgrep)

* [node](https://github.com/nodejs/node)

* [shellcheck](https://github.com/koalaman/shellcheck)

* [ascii-image-converter](https://github.com/TheZoraiz/ascii-image-converter)

* [neofetch](https://github.com/dylanaraps/neofetch)

* [bat](https://github.com/sharkdp/bat)

* [github-cli](https://github.com/cli/cli)

### 2.2 Try out

* [btop](https://github.com/aristocratos/btop)

---

## 3. Editor

My current editor is [Neovim](https://github.com/neovim/neovim).

### 3.1 Theme

My current theme is [**onedark**](https://github.com/navarasu/onedark.nvim).

Before I was using [sonokai](https://github.com/sainnhe/sonokai), but wasn't compatible with twilight and zen-mode.

### 3.2. Plugins

Here are listed my current installed plugins in the editor.

* [packer](https://github.com/wbthomason/packer.nvim)

* [lualine](https://github.com/nvim-lualine/lualine.nvim)

* [lspconfig](https://github.com/neovim/nvim-lspconfig)

* [lsp-installer](https://github.com/williamboman/nvim-lsp-installer) -> This plugin need to be updated to [mason](https://github.com/williamboman/mason.nvim).

* [markdown-preview](https://github.com/iamcco/markdown-preview.nvim)

* [which-key](https://github.com/folke/which-key.nvim)

* [nvim-tree](https://github.com/kyazdani42/nvim-tree.lua)

* [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons)

* [plenary](https://github.com/nvim-lua/plenary.nvim)

* [telescope](https://github.com/nvim-telescope/telescope.nvim)

* [telescope-fzf-native](https://github.com/nvim-telescope/telescope-fzf-native.nvim)

* [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

* [image.nvim](https://github.com/samodostal/image.nvim)

* [ascii-image-converter](https://github.com/TheZoraiz/ascii-image-converter)

* [trouble](https://github.com/folke/trouble.nvim)

* [symbols-outline](https://github.com/simrat39/symbols-outline.nvim)

* [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)

* [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)

* [cmp-buffer](https://github.com/hrsh7th/cmp-buffer)

* [cmp-path](https://github.com/hrsh7th/cmp-path)

* [cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline)

* [lspkind.nvim](https://github.com/onsails/lspkind.nvim)

* [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip)

* [luasnip](https://github.com/L3MON4D3/LuaSnip)

* [twilight](https://github.com/folke/twilight.nvim)

* [zen-mode](https://github.com/folke/zen-mode.nvim)

* [gitsigns](https://github.com/lewis6991/gitsigns.nvim)

* [nvim-scrollbar](https://github.com/petertriho/nvim-scrollbar)

* [nvim-treesitter-context](https://github.com/nvim-treesitter/nvim-treesitter-context)

* [auto-session](https://github.com/rmagatti/auto-session)

* [winshift](https://github.com/sindrets/winshift.nvim)

* [colorizer](https://github.com/NvChad/nvim-colorizer.lua)

* [hop](https://github.com/phaazon/hop.nvim)

* [barbar](https://github.com/romgrk/barbar.nvim)

### 3.3. Try out

Marks:

* :star: &rarr; Will be tried first.
* :fire: &rarr; Added to current plugins.
* :x: &rarr; Tried; didn't work.

#### LSP

* https://github.com/ray-x/lsp_signature.nvim
* https://github.com/jose-elias-alvarez/null-ls.nvim

#### Syntax

* https://github.com/kylechui/nvim-surround :star:

#### Marks

* https://github.com/ThePrimeagen/harpoon

#### Note taking

* https://github.com/nvim-neorg/neorg
* https://github.com/jbyuki/venn.nvim

#### Debugging

* https://github.com/mfussenegger/nvim-dap
* https://github.com/rcarriga/nvim-dap-ui
* https://github.com/Pocco81/dap-buddy.nvim

#### Language

* https://github.com/lewis6991/spellsitter.nvim

#### Indent

* https://github.com/lukas-reineke/indent-blankline.nvim

#### Git

* https://github.com/sindrets/diffview.nvim

#### Comment

* https://github.com/numToStr/Comment.nvim :star:
* https://github.com/folke/todo-comments.nvim :star:

#### Code runner

* https://github.com/michaelb/sniprun

#### Github

* https://github.com/pwntester/octo.nvim :star:

#### Editing support

* https://github.com/windwp/nvim-autopairs :star:
* https://github.com/bennypowers/nvim-regexplainer :star:

#### Formatting

* https://github.com/mhartington/formatter.nvim
* https://github.com/sbdchd/neoformat

#### Testing

* https://github.com/nvim-neotest/neotest

#### Competitive programming

* https://github.com/xeluxee/competitest.nvim

#### Split and window

* https://github.com/beauwilliams/focus.nvim :star:
