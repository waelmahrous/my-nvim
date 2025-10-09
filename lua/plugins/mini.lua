-- Mini plugins
return {
    {
        "nvim-mini/mini.nvim",
        version = "*",
        config = function()
            require("mini.animate").setup {
                cursor = { enable = false },
                scroll = { enable = false },
            }
            require("mini.ai").setup {}
            require("mini.surround").setup {}
        end,
    },
}
