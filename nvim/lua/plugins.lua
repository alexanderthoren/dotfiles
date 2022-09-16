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

	-- WhichKey
	use 'folke/which-key.nvim'

	-- Tree
	use {
		'kyazdani42/nvim-tree.lua',
		requires = {
			'kyazdani42/nvim-web-devicons', -- optional, for file icons
		},
	}

	-- Telescope
	use {
		'nvim-telescope/telescope.nvim',
		tag = '0.1.0',
		requires = {
			'nvim-lua/plenary.nvim',
		}
	}

	-- Telescope-fzf-native
	use {
		'nvim-telescope/telescope-fzf-native.nvim',
		run = 'make'
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
