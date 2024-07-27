vim.g.mapleader = " "
vim.keymap.set("n", "<leader>n", ":Neotree toggle<CR>")
vim.api.nvim_set_keymap("n", "<leader>fo", "<cmd>lua vim.lsp.buf.formatting()<CR>", { noremap = true, silent = true })
vim.opt.signcolumn = "auto"

-- Example keybindings for nvim-dap
vim.keymap.set("n", "<F5>", function()
	require("dap").continue()
end, {})
vim.keymap.set("n", "<F10>", function()
	require("dap").step_over()
end, {})
vim.keymap.set("n", "<F11>", function()
	require("dap").step_into()
end, {})
vim.keymap.set("n", "<F12>", function()
	require("dap").step_out()
end, {})
vim.keymap.set("n", "<leader>b", function()
	require("dap").toggle_breakpoint()
end, {})
vim.keymap.set("n", "<leader>dr", function()
	require("dap").repl.toggle()
end, {})
vim.keymap.set("n", "<leader>p", function()
	require("dapui").toggle()
end, {})

vim.api.nvim_set_keymap("t", "<C-`>", "<C-\\><C-n>", { noremap = true })

vim.keymap.set("n", "<C-`>", ":ToggleTerm <CR>")
