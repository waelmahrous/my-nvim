vim.opt.expandtab = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

-- Filetypes that should still use spaces
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "lua", "python", "yaml", "markdown", "json" },
    callback = function()
        vim.opt_local.expandtab = true
        vim.opt_local.shiftwidth = 4
        vim.opt_local.softtabstop = 4
        vim.opt_local.tabstop = 4
    end,
})
