-- lua/move_lines.lua
-- Move lines up/down with Ctrl+J / Ctrl+K in both normal and visual mode

local opts = { noremap = true, silent = true }

-- Visual mode: move the selected block down/up
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv", opts)
