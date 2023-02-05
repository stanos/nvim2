vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	-- using packer.nvim
	use { 'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons' }
	use 'folke/tokyonight.nvim'
	use { "catppuccin/nvim", as = "catppuccin" }
	use {
		'lewis6991/gitsigns.nvim',
	}
	use 'rcarriga/nvim-notify'
	use 'EdenEast/nightfox.nvim'
	use 'kabouzeid/nvim-lspinstall'
	use 'arzg/vim-substrata'
	use 'kdheepak/lazygit.nvim'
	use 'onsails/lspkind-nvim'
	use 'glepnir/lspsaga.nvim'
	use 'rebelot/kanagawa.nvim'
	use 'ellisonleao/gruvbox.nvim'
	use {
		'nvim-telescope/telescope.nvim',
		-- or                            , branch = '0.1.x',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}
	use 'xiyaowong/telescope-emoji.nvim'
	use 'nvim-telescope/telescope-symbols.nvim'
	use 'nvim-telescope/telescope-file-browser.nvim'
	use 'safv12/andromeda.vim'
	use 'williamboman/mason-lspconfig.nvim'
	use 'williamboman/mason.nvim'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/nvim-cmp'
	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'
	use 'rafamadriz/friendly-snippets'
	use {
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			}
		end
	}
	use 'neovim/nvim-lspconfig'
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
end)
