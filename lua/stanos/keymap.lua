vim.keymap.set('n', '<C-a>', 'gg<S-v>G')
vim.keymap.set('n', '<leader>ncf', ':e ~/.config/nvim/<CR>')
vim.keymap.set('n', '<leader>ncp', ':e ~/.config/nvim/lua/stanos/plugins.lua<CR>')
vim.keymap.set('n', '<leader>ncs', ':e ~/.config/nvim/lua/stanos/init.lua<CR>')
vim.keymap.set('n', '<leader>ps', ':PackerSync<CR>')
-- Split window
vim.keymap.set('n', 'ss', ':split<Return><C-w>w')
vim.keymap.set('n', 'sv', ':vsplit<Return><C-w>w')
vim.keymap.set('n', '<Space>', '<C-w>w')
vim.keymap.set('i', 'jk', '<ESC>')
vim.keymap.set('n', '<ESC>', ':nohlsearch<CR>')

vim.keymap.set('n', 'gll', ':LazyGit<CR>')

vim.keymap.set('n', '<TAB>', ':BufferLineCycleNext<CR>')
vim.keymap.set('n', '<S-TAB>', ':BufferLineCyclePrev<CR>')
