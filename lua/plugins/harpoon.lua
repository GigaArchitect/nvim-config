local harpoon = require('harpoon')
harpoon:setup({})

vim.keymap.set("n", "<C-e>", function()  harpoon.ui:toggle_quick_menu(harpoon:list()) end,
    { desc = "Open harpoon window" })

-- Harpoon
vim.keymap.set("n", "<C-a>", function() harpoon:list():add() end)
--vim.keymap.set("n", "<C-d>", function() harpoon:list():remove() end)

vim.keymap.set("n", "<M-1>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<M-2>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<M-3>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<M-4>", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<M-p>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<M-n>", function() harpoon:list():next() end)
