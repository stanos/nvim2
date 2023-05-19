local opt = vim.opt

-- Theme / Colorscheme
vim.cmd [[colorscheme rose-pine]]
vim.cmd [[set timeoutlen=350]]

-- numbers
opt.relativenumber = true
opt.number = true

-- OPT = options
opt.spell = true
opt.spelllang = 'en_us'
opt.clipboard:append { 'unnamedplus' }
opt.ignorecase = true
opt.smartcase = true
opt.termguicolors = true
opt.winblend = 0
opt.wrap = false
opt.wildoptions = 'pum'
opt.pumblend = 5
opt.cursorline = true
opt.background = 'dark'
opt.completeopt = { 'menuone', 'noselect', 'noinsert' }
opt.shiftwidth = 2
opt.undofile = true
opt.tabstop = 2
opt.list = true
opt.lcs = 'eol:⏎,trail:.,tab:>-,multispace:---+'
vim.notify = require("notify")
require("notify").setup({
	background_colour = "#000000",
})
