-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = ' '
vim.g.maplocalleader = "\\"

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

vim.keymap.set('n', '<leader>y', '\"+y')
vim.keymap.set('v', '<leader>y', '\"+y')
vim.keymap.set('n', '<leader>Y', '\"+Y')
vim.keymap.set('n', '<leader>p', '\"+p')
vim.keymap.set('v', '<leader>p', '\"+p')
vim.keymap.set('n', '<leader>P', '\"+P')

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- import your plugins
		{ import = "plugins" },
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "tokyonight-day" } },

	-- automatically check for plugin updates
	checker = { enabled = true },
})
