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
	'kyazdani42/nvim-web-devicons',
	'kyazdani42/nvim-tree.lua',
	'nvim-lua/plenary.nvim',
	{
		'nvim-telescope/telescope.nvim',
		dependencies = {
			'nvim-telescope/telescope-fzf-native.nvim',
			build = 'make'
		}
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
	'hrsh7th/nvim-cmp',
	'onsails/lspkind.nvim',
	'L3MON4D3/LuaSnip',
	'simrat39/symbols-outline.nvim',
	'lewis6991/gitsigns.nvim',
	'petertriho/nvim-scrollbar',
	'folke/twilight.nvim',
	'folke/zen-mode.nvim',
	'rmagatti/auto-session',
	'sindrets/winshift.nvim',
	'NvChad/nvim-colorizer.lua',
	'phaazon/hop.nvim',
	'windwp/nvim-autopairs',
	'kylechui/nvim-surround',
	'pwntester/octo.nvim',
	'folke/todo-comments.nvim',
	'numToStr/Comment.nvim',
	'ray-x/lsp_signature.nvim',
	{
		"nvim-neorg/neorg",
		build = ":Neorg sync-parsers",
		opts = {
			load = {
				["core.defaults"] = {}, -- Loads default behaviour
				["core.norg.concealer"] = {}, -- Adds pretty icons to your documents
				["core.norg.dirman"] = { -- Manages Neorg workspaces
					config = {
						workspaces = {
							notes = "~/notes",
						},
					},
				},
			},
		},
		dependencies = { { "nvim-lua/plenary.nvim" } },
	},
	{
		'romgrk/barbar.nvim',
		lazy = false,
		wants = 'nvim-web-devicons'
	},
	{
		'nvim-treesitter/nvim-treesitter-context',
		lazy = false,
	},
	{
		'hrsh7th/cmp-buffer',
		lazy = false,
	},
	{
		'hrsh7th/cmp-nvim-lsp',
		lazy = false,
	},
	{
		'saadparwaiz1/cmp_luasnip',
		lazy = false,
	},
	{
		'hrsh7th/cmp-path',
		lazy = false,
	},
	{
		'hrsh7th/cmp-cmdline',
		lazy = false,
	},
	{
		'iamcco/markdown-preview.nvim',
		lazy = false,
		run = function()
			vim.fn['mkdp#util#install']()
		end,
	}
}
