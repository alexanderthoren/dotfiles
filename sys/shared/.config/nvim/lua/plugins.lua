return {
	{
		'navarasu/onedark.nvim',
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme onedark]])
		end,
	},
	'nvim-lualine/lualine.nvim',
	'folke/which-key.nvim',
	{
		'iamcco/markdown-preview.nvim',
		run = function()
			vim.fn['mkdp#util#install']()
		end,
	},
	'kyazdani42/nvim-web-devicons',
	'kyazdani42/nvim-tree.lua',
	'nvim-lua/plenary.nvim',
	'nvim-telescope/telescope.nvim',
	{
		'nvim-telescope/telescope-fzf-native.nvim',
		run = 'make'
	},
	{
		'nvim-treesitter/nvim-treesitter',
		run = function()
			require('nvim-treesitter.install').update({ with_sync = true })
		end,
	},
 'samodostal/image.nvim',
 'folke/trouble.nvim',
 'williamboman/mason.nvim',
 'williamboman/mason-lspconfig.nvim',
 'neovim/nvim-lspconfig',
 'hrsh7th/cmp-buffer',
 'hrsh7th/cmp-nvim-lsp',
 'hrsh7th/nvim-cmp',
 'onsails/lspkind.nvim',
 'L3MON4D3/LuaSnip',
 'saadparwaiz1/cmp_luasnip',
 'hrsh7th/cmp-path',
 'hrsh7th/cmp-cmdline',
 'simrat39/symbols-outline.nvim',
 'lewis6991/gitsigns.nvim',
 'petertriho/nvim-scrollbar',
 'folke/twilight.nvim',
 'folke/zen-mode.nvim',
 'nvim-treesitter/nvim-treesitter-context',
 'rmagatti/auto-session',
 'sindrets/winshift.nvim',
 'NvChad/nvim-colorizer.lua',
 'phaazon/hop.nvim',
 {
		'romgrk/barbar.nvim',
		wants = 'nvim-web-devicons'
	},
 'windwp/nvim-autopairs',
 'kylechui/nvim-surround',
 'pwntester/octo.nvim',
 'folke/todo-comments.nvim',
 'numToStr/Comment.nvim',
 'ray-x/lsp_signature.nvim',
}
