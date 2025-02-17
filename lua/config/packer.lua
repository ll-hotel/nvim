local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
	use('wbthomason/packer.nvim')
	use({
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	})
	use({
		'nvim-telescope/telescope.nvim',
		requires = { { 'nvim-lua/plenary.nvim' } }
	})
	use('42Paris/42header')
	-- use({ 'catppuccin/nvim', name = 'catppuccin', config = function () vim.cmd.colorscheme('catppuccin-mocha') end })
	use({
		'folke/tokyonight.nvim',
		config = function()
			vim.cmd.colorscheme('tokyonight-day')
		end
	})
	use({
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	})
	use({
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			{ 'williamboman/mason.nvim' },
			{ 'williamboman/mason-lspconfig.nvim' },
			-- LSP Support
			{ 'neovim/nvim-lspconfig' },
			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'L3MON4D3/LuaSnip' }
		}
	})
	-- use {
	-- 	'azratul/live-share.nvim',
	-- 	requires = {'jbyuki/instant.nvim'}
	-- }
	use { 'jiangmiao/auto-pairs' }

	if packer_bootstrap then
		require('packer').sync()
	end
end)
