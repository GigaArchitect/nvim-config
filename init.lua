local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		dependencies = { { "nvim-lua/plenary.nvim" } },
	},

	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
	},

	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("plugins.tree-sitter")
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
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		-- setting the keybinding for LazyGit with 'keys' is recommended in
		-- order to load the plugin when the command is run for the first time
		keys = {
			{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
		},
	},

	-- Other plugins
	{ "tanvirtin/monokai.nvim" },
	{ "rose-pine/neovim", name = "rose-pine" },
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "neovim/nvim-lspconfig" },
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-cmdline" },
	{ "hrsh7th/vim-vsnip" },
	{ "dundalek/lazy-lsp.nvim" },
	{ "m4xshen/autoclose.nvim" },
	{ "VonHeikemen/lsp-zero.nvim" },
	{ "stevearc/conform.nvim" },
	{ "zapling/mason-conform.nvim" },
	{ "mfussenegger/nvim-lint" },
	{ "ArcaneSpecs/HexEditor.nvim" },
	{ "jay-babu/mason-null-ls.nvim" },
	{ "mfussenegger/nvim-dap" },
	{ "rcarriga/nvim-dap-ui" },
	{ "akinsho/toggleterm.nvim", version = "*", config = true },
	{ "mfussenegger/nvim-dap-python" },
	{ "jay-babu/mason-nvim-dap.nvim" },
	{ "nvim-lua/plenary.nvim" },
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{ "nvim-neotest/nvim-nio" },
	{ "windwp/nvim-ts-autotag" },

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
})
require("plugins")
vim.opt.wrap = true
vim.wo.number = true
vim.wo.relativenumber = true
require("autoclose").setup()

vim.cmd("set tabstop=4")

-- Function to check if a file or directory exists in the system
local function is_executable(path)
	local executable_found = io.popen("test -x " .. path .. " && echo 'true' || echo 'false'")
	local result = executable_found:read("*a")
	executable_found:close()
	return result:match("^true") ~= nil
end

-- Path to win32yank
local win32yank_path = "/mnt/c/win32yank.exe"

-- Check if win32yank is available
local has_win32yank = is_executable(win32yank_path)

-- Set clipboard mappings if win32yank is available
if has_win32yank then
	vim.cmd([[
        " Use win32yank for clipboard integration
        let g:clipboard = {
            \   'name': 'win32yank-wsl2',
            \   'copy': {
            \      '+': ']] .. win32yank_path .. [[ -i --crlf',
            \      '*': ']] .. win32yank_path .. [[ -i --crlf',
            \   },
            \   'paste': {
            \      '+': ']] .. win32yank_path .. [[ -o --lf',
            \      '*': ']] .. win32yank_path .. [[ -o --lf',
            \   },
            \   'cache_enabled': 0,
            \}
    ]])
end
