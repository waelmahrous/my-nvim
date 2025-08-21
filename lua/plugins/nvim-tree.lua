-- ~/.config/nvim/lua/plugins/nvim-tree.lua

return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
      vim.opt.termguicolors = true

      local function set_tree_highlights()
        vim.api.nvim_set_hl(0, "NvimTreeNormal",      { link = "Normal" })
        vim.api.nvim_set_hl(0, "NvimTreeNormalNC",    { link = "Normal" })
        vim.api.nvim_set_hl(0, "NvimTreeNormalFloat", { link = "Normal" })
        vim.api.nvim_set_hl(0, "NvimTreeEndOfBuffer", { link = "Normal" })
        vim.api.nvim_set_hl(0, "NvimTreeCursorLine",  { link = "Substitute" })
      end

      require("nvim-tree").setup({
        view = { width = 40 },

        update_focused_file = {
          enable = true,
          update_cwd = true,
        },

        on_attach = function(bufnr)
          local api = require("nvim-tree.api")
          -- keep default mappings
          api.config.mappings.default_on_attach(bufnr)
          -- then apply highlights
          set_tree_highlights()
        end,
      })

      -- apply once at startup
      set_tree_highlights()
    end,

    keys = {
      { "<leader>o", "<cmd>NvimTreeToggle<cr>", desc = "Open nvimtree" },
    },
  },
}
