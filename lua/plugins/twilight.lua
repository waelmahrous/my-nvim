-- lua/plugins/twilight.lua
return {
  "folke/twilight.nvim",
  cmd = { "Twilight", "TwilightEnable", "TwilightDisable" }, -- lazy-load only on command
  opts = {
    dimming = { alpha = 0.25, inactive = true },
    context = 0,
    treesitter = true,
    expand = { "function", "method", "program", "source_file" },
    exclude = {},
  },
  keys = {
    { "<leader>zt", "<cmd>Twilight<cr>", desc = "Toggle Twilight Mode" },
  },
}

