return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "saghen/blink.cmp",
        },
        config = function()
            local capabilities = require("blink.cmp").get_lsp_capabilities()

            local lsp_servers = {
                "astral_ty",
                "fish_lsp",
                "kotlin_language_server",
                "bashls",
                "ruff",
                "hyprls",
                "gopls",
                "html",
                "lua_ls",
                "lemminx",
                "cssls",
                "hls",
                "elixirls",
                "jdtls",
                "rust_analyzer",
                "clangd",
                "zls",
                "pylsp",
            }

            for _, server in pairs(lsp_servers) do
                vim.lsp.config(server, { capabilities = capabilities })
            end

            vim.lsp.config.astral_ty = {
                cmd = { "ty", "server" },
                filetypes = { "python" },
                root_markers = {
                    ".git/",
                    "Pipfile",
                    "poetry.lock",
                    "pyproject.toml",
                    "setup.py",
                    "setup.cfg",
                    "requirements.txt",
                    "ty.toml",
                    "uv.lock",
                },
            }

            vim.lsp.config.rust_analyzer = {
                capabilities = capabilities,
                -- ---@diagnostic disable-next-line: unused-local
                -- on_attach = function(client, bufnr)
                --     vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
                -- end,
                settings = {
                    ["rust-analyzer"] = {
                        imports = {
                            granularity = {
                                group = "module",
                            },
                            prefix = "self",
                        },
                        cargo = {
                            buildScripts = {
                                enable = true,
                            },
                        },
                        procMacro = {
                            enable = true,
                        },
                    },
                },
            }

            vim.lsp.config.elixirls = {
                cmd = { "elixir-ls" },
            }

            vim.lsp.config.pylsp = {
                settings = {
                    pylsp = {
                        plugins = {
                            pydocstyle = { enabled = false },
                            preload = { enabled = false },
                            autopep8 = { enabled = false },
                            flake8 = { enabled = false },
                            mccabe = { enabled = false },
                            pycodestyle = { enabled = false },
                            pyflakes = { enabled = false },
                            pylint = { enabled = false },
                            yapf = { enabled = false },
                        },
                        flags = {
                            debounce_text_changes = 200,
                        },
                        skip_token_initialization = true,
                    },
                },
            }
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("lsp_attach_disable_ruff_hover", { clear = true }),
                callback = function(args)
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    if client == nil then
                        return
                    end
                    if client.name == "ruff" or client.name == "astral_ty" then
                        -- Disable hover in favor of pylsp
                        client.server_capabilities.hoverProvider = false
                    end
                end,
                desc = "LSP: Disable hover capability from Ruff",
            })

            vim.lsp.enable(lsp_servers)
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, {})
            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.rename, {})
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
        end,
    },
}
