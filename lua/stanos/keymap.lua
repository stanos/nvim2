vim.keymap.set('n', '<C-a>', 'gg<S-v>G')
vim.keymap.set('n', '<leader>ne', ':e ~/.config/nvim/<CR>')
vim.keymap.set('n', '<leader>ps', ':PackerSync<CR>')
-- Split window
vim.keymap.set('n', 'ss', ':split<Return><C-w>w')
vim.keymap.set('n', 'sv', ':vsplit<Return><C-w>w')
vim.keymap.set('n', '<Space>', '<C-w>w')
vim.keymap.set('i', 'jk', '<ESC>')
vim.keymap.set('t', '<ESC>', '<C-\\><C-n>')
vim.keymap.set('n', '<ESC>', ':nohlsearch<CR>')

vim.keymap.set('n', 'gg', ':LazyGit<CR>')
