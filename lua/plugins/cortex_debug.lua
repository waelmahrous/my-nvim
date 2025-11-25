-- Debugging with Cortex-Debug in AstroNvim
-- File: lua/plugins/dap-cortex.lua
return {
    {
        "mfussenegger/nvim-dap",
        keys = {
            {
                "<leader>db",
                function() require("dap").toggle_breakpoint() end,
                desc = "DAP: Toggle Breakpoint",
            },
            {
                "<leader>dc",
                function() require("dap").continue() end,
                desc = "DAP: Continue",
            },
            {
                "<leader>dC",
                function() require("dap").run_to_cursor() end,
                desc = "DAP: Run to Cursor",
            },
            {
                "<leader>dT",
                function() require("dap").terminate() end,
                desc = "DAP: Terminate",
            },
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
            {
                "<leader>du",
                function() require("dapui").toggle {} end,
                desc = "DAP: Toggle UI",
            },
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
            -- Setup cortex-debug
            require("dap-cortex-debug").setup {
                dapui_rtt = true,
                node_path = "node",
            }

            local dap = require "dap"
            local cortex = require "dap-cortex-debug"

            -- Debug configs
            dap.configurations.c = {
                cortex.jlink_config {
                    name = "Cortex-M (J-Link)",
                    cwd = "${workspaceFolder}",
                    executable = "${workspaceFolder}/build/application.elf",
                    device = "RW612",
                    interface = "swd",
                    gdbPath = "/opt/arm-gcc/bin/arm-none-eabi-gdb",
                    toolchainPath = "/usr/bin",
                    toolchainPrefix = "arm-none-eabi",
                    -- make first launch stop at main
                    resetAfterLoad = true, -- ensures a clean start
                    preLaunchCommands = { -- be halted before symbols and bp setup
                        "monitor reset halt",
                    },
                    postLaunchCommands = { -- fallback if runToMain is flaky
                        "tbreak main",
                        "continue",
                    },
                },
            }
            dap.configurations.cpp = dap.configurations.c

            -- dap-ui open/close
            local dapui = require "dapui"
            dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
            dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
            dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

            -- Build-then-continue (only for a fresh session)
            local orig_continue = dap.continue
            local building = false

            local function build_and_continue()
                if building then
                    vim.notify("Build already in progress", vim.log.levels.WARN)
                    return
                end
                building = true
                vim.notify("Building & Flashing!", vim.log.levels.INFO)

                vim.fn.jobstart(
                    { "sh", "-c", "west build application -b iris_evk -p always --config debug; west flash -r jlink" },
                    {
                        stdout_buffered = true,
                        stderr_buffered = true,
                        cwd = vim.fn.getcwd(),
                        on_stdout = function(_, data)
                            if data then
                                vim.schedule(
                                    function()
                                        vim.cmd(
                                            "echohl None | echomsg '"
                                                .. table.concat(data, "\\n"):gsub("'", "''")
                                                .. "'"
                                        )
                                    end
                                )
                            end
                        end,
                        on_stderr = function(_, data)
                            if data then
                                vim.schedule(
                                    function()
                                        vim.cmd(
                                            "echohl WarningMsg | echomsg '"
                                                .. table.concat(data, "\\n"):gsub("'", "''")
                                                .. "'"
                                        )
                                    end
                                )
                            end
                        end,
                        on_exit = function(_, code)
                            building = false
                            if code == 0 then
                                vim.schedule(function()
                                    vim.notify("Build OK. Starting debug.", vim.log.levels.INFO)
                                    orig_continue()
                                end)
                            else
                                vim.schedule(
                                    function()
                                        vim.notify(
                                            "Build failed. Not starting debug. Exit code " .. code,
                                            vim.log.levels.ERROR
                                        )
                                    end
                                )
                            end
                        end,
                    }
                )
            end

            dap.continue = function(...)
                if dap.session() == nil then
                    build_and_continue()
                else
                    orig_continue(...)
                end
            end

            -- Optional: explicit command if you want both behaviors
            -- vim.api.nvim_create_user_command("DapBuildContinue", build_and_continue, {})
        end,
    },
}
