return {
    {
        "saghen/blink.cmp",
        dependencies = {
            "L3MON4D3/LuaSnip",
            "rafamadriz/friendly-snippets",
        },

        version = "1.*",

        opts = {
            keymap = {
                ["<C-m>"] = { "select_and_accept", "fallback" },
                preset = "default",
            },

            appearance = {
                nerd_font_variant = "Nerd Font Mono",
            },
            cmdline = {
                keymap = {
                    ["<Tab>"] = { "select_and_accept" },
                },
                completion = {
                    menu = {
                        auto_show = true,
                    },
                },
            },
            completion = {
                trigger = {
                    show_on_trigger_character = true,
                    show_on_blocked_trigger_characters = function(cxt)
                        if vim.bo.filetype == "python" then
                            return { " ", "\n", "\t", ":" }
                        end
                        return { "\n", " ", "\t" }
                    end,
                },
                list = {
                    selection = {
                        preselect = true,
                        auto_insert = true,
                    },
                },
                menu = {
                    border = "rounded",
                    draw = {
                        treesitter = { "lsp" },
                    },
                },
                documentation = {
                    auto_show = true,
                    window = {
                        border = "rounded",
                    },
                },
            },
            signature = {
                window = {
                    border = "rounded",
                },
            },
            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
            },
            fuzzy = { implementation = "prefer_rust_with_warning" },
        },
        opts_extend = { "sources.default" },
    },
}
