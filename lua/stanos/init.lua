local opt = vim.opt

-- Theme / Colorscheme
vim.cmd [[colorscheme gruvbox-baby]]
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
opt.wrap = false
opt.wildoptions = 'pum'
opt.pumblend = 5
opt.cursorline = true
opt.background = 'dark'
opt.completeopt = { 'menuone', 'noselect', 'noinsert' }
opt.shiftwidth = 2
opt.undofile = true
opt.tabstop = 2
vim.notify = require("notify")
require("notify").setup({
	background_colour = "#000000",
})
