-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.g.autoformat = false;
vim.opt.nu = true;
vim.opt.relativenumber = true;

vim.opt.tabstop = 4;
vim.opt.shiftwidth = 4;
vim.opt.softtabstop = 4;
vim.opt.smartindent = true;
vim.opt.expandtab = false;

vim.opt.wrap = false;

vim.opt.hlsearch = false;
vim.opt.incsearch = true;

vim.opt.termguicolors = true;

vim.opt.scrolloff = 10;

vim.opt.updatetime = 60;

vim.g.user42 = "ll-hotel";
vim.g.mail42 = "ll-hotel@student.42.fr";

vim.g.mapleader = " ";

vim.keymap.set("n", "<leader>y", '"+y');
vim.keymap.set("v", "<leader>y", '"+y');
vim.keymap.set("n", "<leader>Y", '"+Y');

vim.cmd("highlight Normal guibg=none");
