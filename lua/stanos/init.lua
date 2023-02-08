local opt = vim.opt

-- Theme / Colorscheme
vim.cmd [[colorscheme catppuccin]]
vim.cmd [[set timeoutlen=350]]

-- numbers
opt.relativenumber = true
opt.number = true

-- OPT = options
opt.clipboard:append { 'unnamedplus' }
opt.ignorecase = true
opt.smartcase = true
opt.termguicolors = true
opt.winblend = 0
opt.wildoptions = 'pum'
opt.pumblend = 5
opt.background = 'dark'
opt.completeopt = { 'menuone', 'noselect', 'noinsert' }
opt.shiftwidth = 2
opt.tabstop = 2
opt.spell = true
vim.notify = require("notify")
require("notify").setup({
	background_colour = "#000000",
})
