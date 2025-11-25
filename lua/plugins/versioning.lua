-- ~/.config/nvim/lua/plugins/toggleterm-lazygit.lua

return {
    -- Lazygit
    {
        "jesseduffield/lazygit",
        config = function(_)
            vim.keymap.set(
                "n",
                "<leader>gg",
                function()
                    Snacks.terminal.open("lazygit", {
                        win = {
                            width = 0,
                            height = 0,
                            border = "solid",
                            position = "float",
                            wo = {
                                winhighlight = "Normal:Normal,NormalNC:Normal,NormalFloat:Normal,FloatBorder:Normal,FloatTitle:Normal",
                                winblend = 0,
                            },
                        },
                    })
                end,
                { desc = "LazyGit yo" }
            )
        end,
    },
    -- Gitsigns
    {
        "lewis6991/gitsigns.nvim",
        opts = {
            signs = {
                add = { text = "▌" }, -- full block
                change = { text = "▌" }, -- dense shaded block
                delete = { text = "▌" }, -- low block (bottom line)
                topdelete = { text = "▀" }, -- high block (top line)
                changedelete = { text = "▌" }, -- medium shaded block
            },
        },
    },
}
