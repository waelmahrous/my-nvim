-- lua/move_lines.lua
local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<D-j>", ":m .+1<CR>==", { noremap = true, silent = true })
vim.keymap.set("n", "<D-k>", ":m .-2<CR>==", { noremap = true, silent = true })

vim.keymap.set("v", "<D-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "<D-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
