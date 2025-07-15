local function bootstrap_pckr()
	local pckr_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"

	if not (vim.uv or vim.loop).fs_stat(pckr_path) then
		vim.fn.system({
			'git',
			'clone',
			"--filter=blob:none",
			'https://github.com/lewis6991/pckr.nvim',
			pckr_path
		})
	end

	vim.opt.rtp:prepend(pckr_path)
end

bootstrap_pckr()

local cmd = require('pckr.loader.cmd')
local keys = require('pckr.loader.keys')

require('pckr').add({
	-- Post-install/update hook with neovim command
	{
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		config = function()
			require('nvim-treesitter.configs').setup({
				ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
				sync_install = false,
				auto_install = true,
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
			})
		end
	},
	{
		'catppuccin/nvim',
		config = function()
			vim.cmd('colorscheme catppuccin-mocha')
		end
	},
	{
		'nvim-telescope/telescope.nvim',
		requires = {
			'nvim-lua/plenary.nvim'
		},
		config = function()
			local builtin = require('telescope.builtin')
			vim.keymap.set('n', '<leader>f', builtin.find_files, {})
			vim.keymap.set('n', '<leader>/', builtin.live_grep, {})
			vim.keymap.set('n', '<leader>b', builtin.buffers, {})
			vim.keymap.set('n', '<leader>?', builtin.help_tags, {})
		end
	},
	{
		'VonHeikemen/lsp-zero.nvim',
		requires = {
			-- LSP Support
			'neovim/nvim-lspconfig',
			'hrsh7th/cmp-nvim-lsp',
		},
		config = function()
			local lsp_zero = require('lsp-zero')

			lsp_zero.on_attach(function(client, bufnr)
				local opts = { buffer = bufnr, remap = false }
				vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
				vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
				vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
				vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
				vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
				vim.keymap.set("n", "gs", function() vim.lsp.buf.signature_help() end, opts)
				vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
				vim.keymap.set("n", "<leader>]s", function() vim.lsp.buf.workspace_symbol() end, opts)
				vim.keymap.set("n", "<leader>dv", function() vim.diagnostic.open_float() end, opts)
				vim.keymap.set("n", "<leader>dn", function() vim.diagnostic.goto_next() end, opts)
				vim.keymap.set("n", "<leader>dp", function() vim.diagnostic.goto_prev() end, opts)
				vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
				vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
			end)

			local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
			vim.lsp.enable('clangd')
			vim.lsp.config('clangd', { capabilities = lsp_capabilities, })
			vim.lsp.enable('zls')
			vim.lsp.config('zls', { capabilities = lsp_capabilities, })
			vim.lsp.enable('rust_analyzer')
			vim.lsp.config('rust_analyzer', { capabilities = lsp_capabilities, })

			vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
				vim.lsp.handlers.hover, {border = 'rounded'}
			)
			vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
				vim.lsp.handlers.signature_help, {border = 'rounded'}
			)
		end,
	},
	{
		-- Autocompletion
		'hrsh7th/nvim-cmp',
		requires = {
			'VonHeikemen/lsp-zero.nvim',
			'hrsh7th/cmp-nvim-lsp',
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip',
		},
		config = function()
			vim.opt.completeopt = { 'menu', 'menuone', 'noselect'}

			local cmp = require('cmp')
			local cmp_select = { behavior = cmp.SelectBehavior.Select }
			local luasnip = require('luasnip')
			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end
				},
				sources = {
					{ name = 'path' },
					{ name = 'nvim_lsp', keyword_length = 1 },
					{ name = 'buffer', keyword_length = 3 },
					{ name = 'luasnip', keyword_length = 2 }
				},
				window = {
					documentation = cmp.config.window.bordered()
				},
				formatting = require('lsp-zero').cmp_format(),
				mapping = cmp.mapping.preset.insert({
					['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
					['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
					['<C-y>'] = cmp.mapping.confirm({ select = true }),
					['<C-space>'] = cmp.mapping.complete(),
					['<C-j>'] = cmp.mapping.scroll_docs(-4),
					['<C-k>'] = cmp.mapping.scroll_docs(4),
				})
			})
		end
	},
	{
		'mbbill/undotree',
		config = function()
			vim.keymap.set('n', '<leader><F5>', vim.cmd.UndotreeToggle)
		end
	}
})

require('pckr').setup({
	autoremove = true,
	autoinstall = true,
})
