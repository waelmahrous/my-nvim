-- lua/plugins/conform.lua
return {
  "stevearc/conform.nvim",
  opts = function(_, opts)
    -- Ensure tables exist so we can extend safely
    opts.formatters_by_ft = opts.formatters_by_ft or {}
    opts.formatters = opts.formatters or {}

    -- Prefer Mason-installed formatters, fall back to LSP where needed
    -- Add/override only what's relevant here (beautysh for shell files)
    opts.formatters_by_ft.sh   = { "beautysh", "lsp" }
    opts.formatters_by_ft.bash = { "beautysh", "lsp" }
    opts.formatters_by_ft.zsh  = { "beautysh", "lsp" }

    -- Make <leader>lf work smoothly: use tool first, then LSP if no tool available
    opts.format_on_save = opts.format_on_save or { lsp_fallback = true, timeout_ms = 1000 }
    opts.lsp_fallback = true

    return opts
  end,
}
