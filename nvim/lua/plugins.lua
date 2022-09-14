-- Indicate first time installation
local packer_bootstrap = false

-- packer.nvim configuration
local conf = {
	display = {
		open_fn = function()
			return require('packer.util').float { border = 'rounded' }
		end,
	},
}

-- Check if packer.nvim is installed
-- Run PackerCompile if there are changes in this file
local function packer_init()
	local fn = vim.fn
	local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		packer_bootstrap = fn.system {
			'git',
			'clone',
			'--depth',
			'1',
			'https://github.com/wbthomason/packer.nvim',
			install_path,
		}
		vim.cmd [[packadd packer.nvim]]
	end
	vim.cmd 'autocmd BufWritePost plugins.lua source <afile> | PackerCompile'
end

-- Plugins
local function plugins(use)

	-- Packer
	use 'wbthomason/packer.nvim'

	-- Colorscheme
	use {
		'sainnhe/sonokai',
		config = function()
			vim.cmd 'colorscheme sonokai'
		end,
	}

	-- Statusline
	use 'nvim-lualine/lualine.nvim'

	-- LSP
	use 'neovim/nvim-lspconfig'

	-- LSP-Installer
	use 'williamboman/nvim-lsp-installer'

	-- Markdown preview
	use {
		'iamcco/markdown-preview.nvim',
		run = function()
			vim.fn['mkdp#util#install']()
		end,
	}

	if packer_bootstrap then
		print 'Restart Neovim required after installation!'
		require('packer').sync()
	end
end

packer_init()

local packer = require('packer')
packer.init(conf)
packer.startup(plugins)
