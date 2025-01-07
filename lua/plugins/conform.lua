require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "ruff" },
		javascript = { "prettierd", "prettier" },
	},
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 5500,
		lsp_format = "fallback",
	},
})

require("mason-conform").setup()
-- format from conform not lsp
vim.keymap.set("n", "<space>tf", function()
	require("conform").format()
end, opts)

-- linting in nvim-lint extension
local lint = require("lint")
lint.linters_by_ft = {
	python = {
		"ruff",
	},
}

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
-- InsertLeave Won't work here as the linters lint the file on disk saved not the buffer opened'
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		lint.try_lint()
	end,
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
	callback = function()
		lint.try_lint()
	end,
})
