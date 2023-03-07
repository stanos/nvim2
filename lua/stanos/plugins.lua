vim.cmd [[packadd packer.nvim]]

require('hologram').setup{
    auto_display = true -- WIP automatic markdown image display, may be prone to breaking
}

require('adoc_pdf_live').setup()

require('leap').add_default_mappings()

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	-- using packer.nvim
	use { 'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons' }
	use 'folke/tokyonight.nvim'
	use { "catppuccin/nvim", as = "catppuccin" }
	use 'lervag/vimtex'
	use 'mfussenegger/nvim-dap'
	use {'stevearc/dressing.nvim'}
	use {'stevearc/vim-arduino'}
	use "mfussenegger/nvim-dap-python"
	use {
    'marioortizmanero/adoc-pdf-live.nvim',
    config = "require('adoc_pdf_live').setup()"
}
	use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
	use 'dcampos/cmp-snippy'
	use 'arkav/lualine-lsp-progress'
	use 'luisiacc/gruvbox-baby'
	use({
    "aserowy/tmux.nvim",
    config = function() return require("tmux").setup() end
})
	use 'kevinhwang91/rnvimr'
	use 'jacoborus/tender.vim'
	use {'jdhao/better-escape.vim', event = 'InsertEnter'}
	use 'windwp/nvim-ts-autotag'
	use 'dcampos/nvim-snippy'
	use "ggandor/leap.nvim"
	use "tpope/vim-repeat"
	use {
  "ray-x/lsp_signature.nvim",
	}
	use 'nvim-telescope/telescope-media-files.nvim'
	use {'edluffy/hologram.nvim'}
	use {
  'nvim-tree/nvim-tree.lua',
	  requires = {
	    'nvim-tree/nvim-web-devicons', -- optional, for file icons
	  },
	  tag = 'nightly' -- optional, updated every week. (see issue #1193)
	}
	use 'cocopon/colorswatch.vim'
	use 'drewtempelmeyer/palenight.vim'
	use 'nvim-telescope/telescope-packer.nvim'
	use 'normen/vim-pio'
	use {
	  "nvim-telescope/telescope-frecency.nvim",
	  config = function()
	    require"telescope".load_extension("frecency")
	  end,
	  requires = {"kkharji/sqlite.lua"}
	}
	use {
  	'sudormrfbin/cheatsheet.nvim',

  	requires = {
  	  {'nvim-telescope/telescope.nvim'},
  	  {'nvim-lua/popup.nvim'},
  	  {'nvim-lua/plenary.nvim'},
  	}
	}
	use 'dracula/vim' 
	use 'jose-elias-alvarez/null-ls.nvim'
	use 'norcalli/nvim-colorizer.lua'
	use 'Yazeed1s/minimal.nvim'
	use {
		'lewis6991/gitsigns.nvim',
	}
	use 'rcarriga/nvim-notify'
	use 'RRethy/nvim-base16'
	use {
    'saecki/crates.nvim',
    tag = 'v0.3.0',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
        require('crates').setup()
    end,
	}
	use 'simrat39/rust-tools.nvim'
	use({ "petertriho/cmp-git", requires = "nvim-lua/plenary.nvim" })
	use 'EdenEast/nightfox.nvim'
	use {
		'svrana/neosolarized.nvim',
		requires = { 'tjdevries/colorbuddy.nvim' }
	}
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
	use {
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end
	}
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


