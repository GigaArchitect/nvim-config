require('mustafa')
vim.wo.number = true
vim.wo.relativenumber = true
require("autoclose").setup()

vim.opt.clipboard = "unnamedplus"

if vim.fn.has('wsl') == 1 then

vim.api.nvim_create_autocmd('TextYankPost', {

group = vim.api.nvim_create_augroup('Yank', { clear = true }),

callback = function()

vim.fn.system('clip.exe', vim.fn.getreg('"'))

end,

})

end


