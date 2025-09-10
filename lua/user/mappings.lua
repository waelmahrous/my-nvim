-- Some custom mappings to keep in one place
vim.keymap.set("n", "<C-o>", "<C-o>zz", { desc = "Jump back centered", silent = true })
vim.keymap.set("n", "<C-i>", "<C-i>zz", { desc = "Jump forward centered", silent = true })
vim.keymap.set("n", "G", "Gzz", { desc = "Jump EOF centered", silent = true })

-- (optional) Center after search next/prev
vim.keymap.set("n", "n", "nzzzv", { desc = "Search next centered", silent = true })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Search prev centered", silent = true })
