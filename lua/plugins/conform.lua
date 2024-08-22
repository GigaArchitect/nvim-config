require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
		javascript = { "prettierd", "prettier" },
	},
})

require("mason-conform").setup()

-- linting in nvim-lint extension
local lint = require("lint")
lint.linters_by_ft = {
	python = {
		"pylint",
	},
}

--vim.api.nvim_create_autocmd("BufWritePre", {
--	pattern = "*",
--	callback = function(args)
--		require("conform").format({ bufnr = args.buf })
--	end,
--})
-- InsertLeave Won't work here as the linters lint the file on disk saved not the buffer opened'
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		lint.try_lint()
	end,
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
	callback = function()
		lint.try_lint()
	end,
})
