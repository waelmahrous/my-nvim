-- ~/.config/nvim/lua/plugins/toggleterm-lazygit.lua

return {
  {
    "jesseduffield/lazygit",
    config = function(_)
      vim.keymap.set("n", "<leader>gg", function()
        -- Use snacks for window (thnx for the dim)
        Snacks.terminal.open("lazygit", {
          win = {
            width = 0.85,
            height = 0.85,
            border = "solid",
            position = "float",
            wo = {
              winhighlight = "Normal:Normal,NormalNC:Normal,NormalFloat:Normal,FloatBorder:Normal,FloatTitle:Normal",
              winblend = 0,
            },
          },
        })
      end, { desc = "LazyGit yo" })
    end,
  },
}
