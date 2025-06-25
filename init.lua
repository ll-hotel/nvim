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

-- Plugins

local _ = require('plugins')
