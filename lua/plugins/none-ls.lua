-- lua/plugins/none-ls.lua
---@type LazySpec
return {
    -- Bridge external tools into LSP
    {
        "nvimtools/none-ls.nvim",
        opts = function()
            return { sources = {} } -- keep empty; mason-null-ls will register tools
        end,
    },

    -- Auto-register Mason tools with none-ls
    {
        "jay-babu/mason-null-ls.nvim",
        dependencies = { "williamboman/mason.nvim", "nvimtools/none-ls.nvim" },
        opts = {
            ensure_installed = {
                -- e.g. "stylua", "clang-format", "black", "prettier"
            },
            automatic_installation = true,
            handlers = {
                -- default handler applies to all sources
                function(source_name, methods) require("mason-null-ls").default_setup(source_name, methods) end,
                -- You can override specific sources like this:
                -- stylua = function(source_name, methods)
                --   local nls = require("null-ls")
                --   require("mason-null-ls").default_setup(source_name, methods)
                -- end,
            },
        },
    },
}
