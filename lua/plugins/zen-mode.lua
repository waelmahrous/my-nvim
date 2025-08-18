-- lua/plugins/zen-mode.lua
return {
  {
    "folke/zen-mode.nvim",
    opts = {
      window = {
        backdrop = 0.97,
        width = 140,
        options = {},
      },
      plugins = {
        options = { enabled = true },
        twilight = { enabled = false }, -- <— disable Zen→Twilight integration
        tmux = { enabled = false },
      },
    },
    keys = {
      { "<leader>zz", "<cmd>ZenMode<cr>", desc = "Toggle Zen Mode" },
    },
  },
}
