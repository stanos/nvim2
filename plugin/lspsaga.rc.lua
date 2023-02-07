local status, saga = pcall(require, "lspsaga")
if (not status) then return end

saga.setup({
	ui = {
		winblend = 10,
		border = 'rounded',
	}
})

local diagnostic = require("lspsaga.diagnostic")
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<C-j>', ':Lspsaga diagnostic_jump_next<CR>', opts)
vim.keymap.set('n', 'gl', ':Lspsaga show_cursor_diagnostics<CR>', opts)
vim.keymap.set('n', 'K', ':Lspsaga hover_doc<CR>', opts)
vim.keymap.set('n', 'gd', ':Lspsaga lsp_finder<CR>', opts)
-- vim.keymap.set('i', '<C-k>', ':Lspsaga signature_help<CR>', opts)
vim.keymap.set('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
vim.keymap.set('n', 'gp', ':Lspsaga peek_definition<CR>', opts)
vim.keymap.set('n', 'gr', ':Lspsaga rename<CR>', opts)

-- code action
local codeaction = require("lspsaga.codeaction")
vim.keymap.set("n", "<leader>ca", function() codeaction:code_action() end, { silent = true })
vim.keymap.set("v", "<leader>ca", function()
	vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-U>", true, false, true))
	codeaction:range_code_action()
end, { silent = true })
