return {
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"nvimtools/none-ls.nvim",
		},
		config = function()
			require("mason-null-ls").setup({
				ensure_installed = {
                    "ruff",
                    "hlint",
                    "asmfmt",
                    "ormolu",
                    "stylua",
                    "ruff",
                    -- "ktlint",
                    "prettier",
                    "ktlint",
                    "shfmt",
                    -- "ktfmt",
                    -- "isort",
                    -- "black",
                    "clang_format",
                },
				automatic_installation = true,
			})
		end,
	},
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },
    {
        "nvimtools/none-ls.nvim",
        dependencies = {
            "nvimtools/none-ls-extras.nvim",
        },
        config = function()
            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {
                    -- null_ls.builtins.diagnostics.ktlint,
                    null_ls.builtins.formatting.prettier,
                    null_ls.builtins.formatting.ktlint,
                    null_ls.builtins.formatting.shfmt,
                    -- null_ls.builtins.formatting.ormolu,
                    null_ls.builtins.formatting.asmfmt,
                    -- null_ls.builtins.formatting.ktfmt,
                    null_ls.builtins.formatting.mix,
                    null_ls.builtins.formatting.stylua,
                    require("none-ls.formatting.ruff").with({ extra_args = { "--extend-select", "I" } }),
                    require("none-ls.formatting.ruff_format"),
                    -- null_ls.builtins.formatting.isort,
                    -- null_ls.builtins.formatting.black,
                    null_ls.builtins.formatting.clang_format,
                    null_ls.builtins.formatting.gofmt,

                    -- null_ls.builtins.diagnostics.hlint
                },
            })

            vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
        end,
    },
}
