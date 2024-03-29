# DOTFILES 

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

### 0.1 Plugins

* MacOS
  * [Vimac](https://github.com/dexterleng/vimac) to move through the system without a mouse.
  * [Vimari](https://github.com/televator-apps/vimari) to move through the web browser, Safari.
  * [yabai](https://github.com/koekeishiya/yabai)
  * [skhd](https://github.com/koekeishiya/skhd)
  * [sketchyBar](https://github.com/FelixKratz/SketchyBar)

* Arch Linux
  * [Vimium](https://github.com/philc/vimium) to move through the web browser, Firefox.
  * [BSPWM](https://github.com/baskerville/bspwm).
  * [LightDM](https://github.com/canonical/lightdm) and [LightDM-gtk-greeter](https://github.com/Xubuntu/lightdm-gtk-greeter).
  * [SXHKD](https://github.com/baskerville/sxhkd).
  * [Rofi](https://github.com/davatorium/rofi).
  * [Feh](https://github.com/derf/feh).

## 1. Terminal

My current terminal is [**Alacritty**](https://github.com/alacritty/alacritty).

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

---

## 3. Editor

My current editor is [Neovim](https://github.com/neovim/neovim).

### 3.1 Theme

My current theme is [**onedark**](https://github.com/navarasu/onedark.nvim).

Before I was using [sonokai](https://github.com/sainnhe/sonokai), but wasn't compatible with twilight and zen-mode.

### 3.2. Plugins

Here are listed my current installed plugins in the editor.

* [packer](https://github.com/wbthomason/packer.nvim) -> Check [lazy.nvim](https://github.com/folke/lazy.nvim) and
  migrate to it if it's better and faster.

* [lualine](https://github.com/nvim-lualine/lualine.nvim)

* [lspconfig](https://github.com/neovim/nvim-lspconfig)

* [mason](https://github.com/williamboman/mason.nvim)

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

* [nvim-autopairs](https://github.com/windwp/nvim-autopairs)

* [nvim-surround](https://github.com/kylechui/nvim-surround)

* [octo](https://github.com/pwntester/octo.nvim)

* [todo-comments](https://github.com/folke/todo-comments.nvim)

* [comment](https://github.com/numToStr/Comment.nvim)

* [neorg](https://github.com/nvim-neorg/neorg)

* [lsp_signature](https://github.com/ray-x/lsp_signature.nvim)

### 3.3. Try out

Marks:

* :star: &rarr; Will be tried first.
* :fire: &rarr; Added to current plugins.
* :x: &rarr; Tried; didn't work.

#### LSP

* https://github.com/jose-elias-alvarez/null-ls.nvim :star:
