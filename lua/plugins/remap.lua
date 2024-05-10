vim.g.mapleader = " "
vim.keymap.set('n', '<M-t>', ":ToggleTerm<CR>")
vim.keymap.set("n", "<leader>n", ":Neotree toggle<CR>")
vim.api.nvim_set_keymap('n', '<leader>fo', '<cmd>lua vim.lsp.buf.formatting()<CR>', { noremap = true, silent = true })
