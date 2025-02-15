vim.o.nu = true
vim.o.relativenumber = true

vim.o.colorcolumn = '81'
vim.o.textwidth = 80
vim.o.wrap = true
vim.o.formatoptions = 't'

vim.o.tabstop = 8
vim.o.shiftwidth = 8
vim.o.softtabstop = 8
-- vim.o.tabstop = 4
-- vim.o.shiftwidth = 4
-- vim.o.softtabstop = 4
vim.o.smartindent = true

vim.o.hlsearch = false
vim.o.incsearch = true

vim.o.termguicolors = true

vim.o.scrolloff = 10

vim.o.updatetime = 60

vim.g.user42 = 'll-hotel'
vim.g.mail42 = 'll-hotel@student.42.fr'

vim.g.mapleader = ' '

vim.keymap.set('n', '<leader>y', '\"+y')
vim.keymap.set('v', '<leader>y', '\"+y')
vim.keymap.set('n', '<leader>Y', '\"+Y')
vim.keymap.set('n', '<leader>p', '\"+p')
vim.keymap.set('v', '<leader>p', '\"+p')
vim.keymap.set('n', '<leader>P', '\"+P')
