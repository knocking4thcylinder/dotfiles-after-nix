return {
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
                -- null_ls.builtins.formatting.ktfmt,
                null_ls.builtins.formatting.mix,
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.isort,
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.clang_format,
                null_ls.builtins.formatting.gofmt,
            },
        })

        vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    end,
}
