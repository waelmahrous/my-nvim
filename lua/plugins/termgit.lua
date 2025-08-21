-- ~/.config/nvim/lua/plugins/toggleterm-lazygit.lua

return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = 20,
        open_mapping = [[<c-\>]],
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = -30,
        shading_ratio = -3,
        start_in_insert = true,
        persist_size = true,
        direction = "float",
        close_on_exit = true,
        shell = vim.o.shell,

        float_opts = {
          border = 'rounded',
          winblend = 0,
        }
      })

      -- LazyGit terminal
      local Terminal = require("toggleterm.terminal").Terminal
      local lazygit = Terminal:new({
        cmd = "lazygit",
        hidden = true,
        direction = "float",
        on_open = function(term)
          -- optional: use 'q' to quit lazygit
          vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
        end,
      })

      local function _lazygit_toggle()
        lazygit:toggle()
      end

      -- Keymap to open lazygit
      vim.keymap.set("n", "<leader>gg", _lazygit_toggle, { noremap = true, silent = true, desc = "Toggle LazyGit" })
    end,
  },
}
