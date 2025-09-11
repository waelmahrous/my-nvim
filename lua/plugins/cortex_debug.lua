-- Debugging with Cortex-Debug in AstroNvim
-- File: lua/plugins/dap-cortex.lua
return {
  {
    "mfussenegger/nvim-dap",
    keys = {
      { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "DAP: Toggle Breakpoint" },
      { "<leader>dc", function() require("dap").continue() end, desc = "DAP: Continue" },
      { "<leader>dC", function() require("dap").run_to_cursor() end, desc = "DAP: Run to Cursor" },
      { "<leader>dT", function() require("dap").terminate() end, desc = "DAP: Terminate" },
    },
  },

  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    opts = {},
    keys = {
      { "<leader>du", function() require("dapui").toggle {} end, desc = "DAP: Toggle UI" },
    },
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    dependencies = { "mfussenegger/nvim-dap" },
    opts = {},
  },

  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {}, -- Important so auto-install works
      ensure_installed = {
        -- Useful general adapters; cortex-debug installed via this or VS Code
        "codelldb",
        "bash",
        "python",
        "cortex-debug",
      },
      automatic_installation = true,
    },
  },

  {
    "jedrzejboczar/nvim-dap-cortex-debug",
    dependencies = { "mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui" },
    config = function()
      -- 1) Make sure the VS Code "cortex-debug" extension is available.
      --    Easiest path: :MasonInstall cortex-debug
      --    This plugin will auto-detect Mason’s install dir by default.
      require("dap-cortex-debug").setup {
        -- If auto-detection fails, uncomment and set your path to the VSIX dir that contains dist/debugadapter.js
        -- extension_path = vim.fn.expand("~/.local/share/nvim/mason/packages/cortex-debug/extension"),
        dapui_rtt = true, -- Show RTT pane in dap-ui
        node_path = "node", -- Node.js executable used to run the adapter
      }

      -- 2) Example debug configurations (edit to your project)
      local dap = require "dap"
      local cortex = require "dap-cortex-debug"

      -- Apply to C / C++ buffers
      dap.configurations.c = {
        -- J-Link preset
        cortex.jlink_config {
          name = "Cortex-M (J-Link)",
          cwd = "${workspaceFolder}",
          executable = "${workspaceFolder}/build/application.elf", -- <-- adjust
          device = "RW612", -- <-- set your MCU device name
          interface = "swd",
          -- serialNumber = 0, -- 0 = first found; set a specific serial if you have many
          -- ipAddress = "", -- set to "localhost" if using J-Link GDB Server over TCP
          -- rttConfig = cortex.rtt_config(0),
          -- showDevDebugOutput = false,
          gdbPath = "/opt/arm-gcc/bin/arm-none-eabi-gdb",
          toolchainPath = "/usr/bin",
          toolchainPrefix = "arm-none-eabi",
        },
      }
      dap.configurations.cpp = dap.configurations.c

      -- Optional: open dap-ui automatically on session start/stop
      local dapui = require "dapui"
      dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
      dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
      dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end
    end,
  },
}
