---@diagnostic disable: unused-local, assign-type-mismatch, deprecated
return {
    "scalameta/nvim-metals",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    ft = { "scala", "sbt", "java" },
    opts = function()
        local metals_config = require("metals").bare_config()
        metals_config.init_options.statusBarProvider = "off"
        metals_config.on_attach = function(client, bufnr)
            require("metals").setup_dap()

            -- LSP mappings
            vim.keymap.set("n", "gd", vim.lsp.buf.definition)
            vim.keymap.set("n", "K", vim.lsp.buf.hover)
            vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
            vim.keymap.set("n", "gr", vim.lsp.buf.references)
            vim.keymap.set("n", "gds", vim.lsp.buf.document_symbol)
            vim.keymap.set("n", "gws", vim.lsp.buf.workspace_symbol)
            vim.keymap.set("n", "<leader>cl", vim.lsp.codelens.run)
            vim.keymap.set("n", "<leader>sh", vim.lsp.buf.signature_help)
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
            vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format)
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)

            vim.keymap.set("n", "<leader>ws", function()
                require("metals").hover_worksheet()
            end)

            -- all workspace diagnostics
            vim.keymap.set("n", "<leader>aa", vim.diagnostic.setqflist)

            -- all workspace errors
            vim.keymap.set("n", "<leader>ae", function()
                vim.diagnostic.setqflist({ severity = "E" })
            end)

            -- all workspace warnings
            vim.keymap.set("n", "<leader>aw", function()
                vim.diagnostic.setqflist({ severity = "W" })
            end)

            -- buffer diagnostics only
            vim.keymap.set("n", "<leader>d", vim.diagnostic.setloclist)

            vim.keymap.set("n", "[c", function()
                vim.diagnostic.goto_prev({ wrap = false })
            end)

            vim.keymap.set("n", "]c", function()
                vim.diagnostic.goto_next({ wrap = false })
            end)

            -- Example vim.keymap.setpings for usage with nvim-dap. If you don't use that, you can
            -- skip these
            vim.keymap.set("n", "<leader>dc", function()
                require("dap").continue()
            end)

            vim.keymap.set("n", "<leader>dr", function()
                require("dap").repl.toggle()
            end)

            vim.keymap.set("n", "<leader>dK", function()
                require("dap.ui.widgets").hover()
            end)

            vim.keymap.set("n", "<leader>dt", function()
                require("dap").toggle_breakpoint()
            end)

            vim.keymap.set("n", "<leader>dso", function()
                require("dap").step_over()
            end)

            vim.keymap.set("n", "<leader>dsi", function()
                require("dap").step_into()
            end)

            vim.keymap.set("n", "<leader>dl", function()
                require("dap").run_last()
            end)
        end

        return metals_config
    end,
    config = function(self, metals_config)
        local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
        vim.api.nvim_create_autocmd("FileType", {
            pattern = self.ft,
            callback = function()
                require("metals").initialize_or_attach(metals_config)
            end,
            group = nvim_metals_group,
        })
    end,
}
