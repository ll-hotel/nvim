-- Configuration

vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

vim.o.syntax = "on"
vim.o.number = true
vim.o.relativenumber = true

vim.o.softtabstop = 4
vim.o.tabstop = 4
vim.o.shiftwidth = 4

vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.updatetime = 40

vim.o.termguicolors = true

vim.o.scrolloff = 16

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<M-h>", "<cmd>silent !tmux neww tmux-sessionizer -s 0<CR>")
vim.keymap.set("n", "<M-j>", "<cmd>silent !tmux neww tmux-sessionizer -s 1<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>silent !tmux neww tmux-sessionizer -s 2<CR>")
vim.keymap.set("n", "<M-l>", "<cmd>silent !tmux neww tmux-sessionizer -s 3<CR>")

-- Plugins

local _ = require('plugins')
