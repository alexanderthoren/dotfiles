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

	use 'wbthomason/packer.nvim'

	use {
		'navarasu/onedark.nvim',
		config = function()
			vim.cmd 'colorscheme onedark'
		end,
	}

	use 'nvim-lualine/lualine.nvim'

	use {
		'iamcco/markdown-preview.nvim',
		run = function()
			vim.fn['mkdp#util#install']()
		end,
	}

	use 'folke/which-key.nvim'

	use 'kyazdani42/nvim-web-devicons'
	use 'kyazdani42/nvim-tree.lua'

	use 'nvim-lua/plenary.nvim'

	use {
		'nvim-telescope/telescope.nvim',
		tag = '0.1.0'
	}

	use {
		'nvim-telescope/telescope-fzf-native.nvim',
		run = 'make'
	}

	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
			require('nvim-treesitter.install').update({ with_sync = true })
		end,
	}

	use 'samodostal/image.nvim'

	use 'folke/trouble.nvim'

	use 'neovim/nvim-lspconfig'

	use 'williamboman/nvim-lsp-installer'

	use 'hrsh7th/cmp-buffer'

	use 'hrsh7th/cmp-nvim-lsp'

	use 'hrsh7th/nvim-cmp'

	use 'onsails/lspkind.nvim'

	use 'L3MON4D3/LuaSnip'

	use 'saadparwaiz1/cmp_luasnip'

	use 'hrsh7th/cmp-path'

	use 'hrsh7th/cmp-cmdline'

	use 'simrat39/symbols-outline.nvim'

	use 'lewis6991/gitsigns.nvim'

	use 'petertriho/nvim-scrollbar'

	use 'folke/twilight.nvim'

	use 'folke/zen-mode.nvim'

	use 'nvim-treesitter/nvim-treesitter-context'

	use 'rmagatti/auto-session'

	use 'sindrets/winshift.nvim'

	use 'NvChad/nvim-colorizer.lua'

	use 'phaazon/hop.nvim'

	use {'romgrk/barbar.nvim', wants = 'nvim-web-devicons'}

	use 'windwp/nvim-autopairs'

	use 'kylechui/nvim-surround'

	use 'pwntester/octo.nvim'

	use 'folke/todo-comments.nvim'

	if packer_bootstrap then
		print 'Restart Neovim required after installation!'
		require('packer').sync()
	end
end

packer_init()

local packer = require('packer')
packer.init(conf)
packer.startup(plugins)
