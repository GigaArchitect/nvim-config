local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		require("none-ls.diagnostics.eslint_d"),
    }
})
