local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Set leader key
vim.g.mapleader = " "

require("lazy").setup({
	{
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		event = "BufRead",
		config = function()
			require("plugins.tree-sitter")
		end,
	},
	{
			'vladdoster/remember.nvim',
			config = function()
					require('remember')
			end
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		opts = {},
		config = function()
			require("ibl").setup()
		end
	},
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require('nvim-ts-autotag').setup({
			  opts = {
			    -- Defaults
			    enable_close = true, -- Auto close tags
			    enable_rename = true, -- Auto rename pairs of tags
			    enable_close_on_slash = false -- Auto close on trailing </
			  },
			  per_filetype = {
			    ["html"] = {
			      enable_close = true
			    }
			  }
			})
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{
				"<leader>ff",
				function()
					require("telescope.builtin").find_files()
				end,
				desc = "Find Files",
			},
			{
				"<leader>fg",
				function()
					require("telescope.builtin").live_grep()
				end,
				desc = "Live Grep",
			},
			{
				"<leader>fb",
				function()
					require("telescope.builtin").buffers()
				end,
				desc = "Buffers",
			},
			{
				"<leader>fh",
				function()
					require("telescope.builtin").help_tags()
				end,
				desc = "Help Tags",
			},
		},
		config = function()
			require("plugins.telescope")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		event = "UIEnter",
		dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
		config = function()
			require("plugins.lualine")
		end,
	},
	{
		"kdheepak/lazygit.nvim",
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
		},
	},
	{
		"williamboman/mason.nvim",
		lazy = true,
		cmd = {
			"Mason",
			"MasonInstall",
			"MasonUninstall",
			"MasonLog",
			"MasonUninstallAll",
		},
		config = function()
			require("plugins.mason-lsp")
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		after = "mason.nvim",
	},
	{
		"neovim/nvim-lspconfig",
		after = "mason-lspconfig.nvim",
	},
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		config = function()
			require("plugins.cmp")
		end,
	},
	{
		"hrsh7th/cmp-nvim-lsp",
		after = "nvim-cmp",
	},
	{
		"hrsh7th/cmp-buffer",
		after = "nvim-cmp",
	},
	{
		"hrsh7th/cmp-path",
		after = "nvim-cmp",
	},
	{
		"hrsh7th/cmp-cmdline",
		after = "nvim-cmp",
	},
	{
		"hrsh7th/vim-vsnip",
		event = "InsertEnter",
	},
	{
		"dundalek/lazy-lsp.nvim",
		lazy = true,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		-- use opts = {} for passing setup options
		-- this is equalent to setup({}) function
	},
	{
		"VonHeikemen/lsp-zero.nvim",
		lazy = true,
	},
	{
		"stevearc/conform.nvim",
		lazy = true,
		event = "InsertEnter",
	},
	{
		"zapling/mason-conform.nvim",
		after = "nvim-lint",
	},
	{
		"mfussenegger/nvim-lint",
		config = function()
			require("plugins.conform")
		end,
	},
	{
		"ArcaneSpecs/HexEditor.nvim",
		cmd = {
			"HexAssemble",
			"HexDump",
			"HexToggle",
			"Hexplore",
		},
	},
	{
		"jay-babu/mason-null-ls.nvim",
		after = "mason.nvim",
	},
	{
		"nvim-lua/plenary.nvim",
	},
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("plugins.harpoon")
		end,
	},
	{
		"nvim-neotest/nvim-nio",
	},
})

-- General settings
vim.opt.wrap = true
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.signcolumn = "no"
vim.opt.scrolloff = 10
vim.opt.autochdir = true
vim.cmd("set tabstop=4")
vim.cmd("colorscheme 256-noir")
-- Open Netrw
vim.api.nvim_set_keymap('n', '<leader>e', ':Lexplore<CR>', { noremap = true, silent = true })
vim.opt.list = true
vim.opt.listchars:append("space:·")
