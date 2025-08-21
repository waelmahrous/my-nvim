-- lua/user/colorscheme.lua
return {
  "sainnhe/gruvbox-material",
  lazy = false, -- load immediately
  priority = 1000, -- make sure it loads before other plugins
  config = function()
    -- Equivalent to your Vimscript settings
    if vim.fn.has("termguicolors") == 1 then
      vim.o.termguicolors = true
    end

    vim.o.background = "dark"

    vim.g.gruvbox_material_background = "hard"
    vim.g.gruvbox_material_better_performance = 1

    -- Apply colorscheme
    vim.cmd("colorscheme gruvbox-material")

    -- Optional: configure lightline (if you use it in AstroNvim)
    vim.g.lightline = { colorscheme = "gruvbox_material" }
  end,
}
