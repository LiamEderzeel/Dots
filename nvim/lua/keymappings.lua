vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', {noremap = true, silent = true})
vim.g.mapleader = ' '

vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {silent = true})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {silent = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {silent = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {silent = true})

vim.api.nvim_set_keymap('n', '<A-h>', ':vertical resize -2<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<A-j>', ':resize +2<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<A-k>', ':resize -2<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<A-l>', ':vertical resize +2<CR>', {silent = true})

vim.api.nvim_set_keymap('n', 'J', '5j', {})
vim.api.nvim_set_keymap('n', 'K', '5k', {})
vim.api.nvim_set_keymap('n', 'R', '<Nop>', {})
vim.api.nvim_set_keymap('n', 'r', '<Nop>', {})

vim.api.nvim_set_keymap('n', '<Enter>', 'za', {})

vim.api.nvim_set_keymap('v', '<', '<gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '>', '>gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<Leader><Esc>', '<C-\\><C-n>', {noremap = true})

