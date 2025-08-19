-- ~/.config/nvim/lua/plugins/nvim-tree.lua

return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
      vim.opt.termguicolors = true

      require("nvim-tree").setup({
        view = {
          width = 40,
        },
      })

    end,

    -- Custom mappings
    keys = {
      { "<leader>o", "<cmd>NvimTreeToggle<cr>", desc = "Open nvimtree" },
    },
  },
}
