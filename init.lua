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
		"kawre/leetcode.nvim",
		build = ":TSUpdate html",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim", -- required by telescope
			"MunifTanjim/nui.nvim",

			-- optional
			"nvim-treesitter/nvim-treesitter",
			"rcarriga/nvim-notify",
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			-- configuration goes here
		},
	},
	{
		"lambdalisue/vim-suda",
	},
	{
		"vladdoster/remember.nvim",
		config = function()
			require("remember")
		end,
	},
	{
		"onsails/lspkind.nvim",
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		opts = {},
		config = function()
			require("ibl").setup()
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		event = "UIEnter",
		config = function()
			require("nvim-ts-autotag").setup({
				opts = {
					-- Defaults
					enable_close = true, -- Auto close tags
					enable_rename = true, -- Auto rename pairs of tags
					enable_close_on_slash = false, -- Auto close on trailing </
				},
				per_filetype = {
					["html"] = {
						enable_close = true,
					},
				},
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
		event = "VimEnter",
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
		lazy = true,
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
		config = function()
			require("plugins.conform")
		end,
	},
	{
		"mfussenegger/nvim-lint",
		event = "UIEnter",
	},
	{
		"ArcaneSpecs/HexEditor.nvim",
		-- cmd = {
		-- 	"HexAssemble",
		-- 	"HexDump",
		-- 	"HexToggle",
		-- 	"Hexplore",
		-- },
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
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
	},
	{
		"navarasu/onedark.nvim",
		name = "one-dark",
		config = function()
			require("onedark").setup({
				style = "warmer",
			})
		end,
	},
	{
		"numToStr/Comment.nvim",
		opts = {},
	},
	{
		"github/copilot.vim",
		event = "InsertEnter",
		cmd = "Copilot",
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
			{ "nvim-lua/plenary.nvim", branch = "master" },
		},
		event = "UIEnter",
		build = "make tiktoken",
		opts = {
			-- See Configuration section for options
		},
		-- See Commands section for default commands if you want to lazy load on them
	},
})
require("HexEditor").setup()
vim.opt.wrap = true
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.signcolumn = "no"
vim.opt.scrolloff = 10
vim.opt.autochdir = true

vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set softtabstop=4")

vim.cmd("colorscheme onedark")
vim.api.nvim_set_keymap("n", "<leader>e", ":Neotree toggle<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<M-h>", ":CopilotChat <cr>", { noremap = true, silent = true })
vim.g.loaded_perl_provider = 0
vim.o.autochdir = false
vim.o.signcolumn = "yes" -- Always show the sign column

-- Javascript
-- Set tabs to 2 spaces for JavaScript files
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "javascript", "typescript", "typescriptreact", "javascriptreact", "html", "xml", "css", "less", "scss" },
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.shiftwidth = 2
		vim.opt_local.expandtab = true
	end,
})
