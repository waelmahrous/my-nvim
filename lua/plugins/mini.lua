-- Mini plugins
return {
  {
    "nvim-mini/mini.nvim",
    version = "*",
    config = function()
      -- Example: activate only the modules you need:
      require("mini.ai").setup({})
    end,
  },
}
