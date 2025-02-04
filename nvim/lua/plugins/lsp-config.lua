return {
	{},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- "nvim-cmp"
		},
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			lspconfig.lua_ls.setup({ capabilities = capabilities })
			lspconfig.lemminx.setup({ capabilities = capabilities })
			lspconfig.hls.setup({ capabilities = capabilities })
			lspconfig.elixirls.setup({ capabilities = capabilities, cmd = { "elixir-ls" } })
			lspconfig.jdtls.setup({ capabilities = capabilities })
			lspconfig.metals.setup({
				capabilities = capabilities,
				cmd = { "metals" },
				filetypes = { "scala" },
				init_options = {
					compilerOptions = {
						snippetAutoIndent = false,
					},
					isHttpEnabled = true,
					statusBarProvider = "show-message",
				},
				message_level = 4,
			})
			lspconfig.rust_analyzer.setup({
				-- on_attach = function(client, bufnr)
				--     vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
				-- end,
				-- settings = {
				--     ["rust-analyzer"] = {
				--         imports = {
				--             granularity = {
				--                 group = "module",
				--             },
				--             prefix = "self",
				--         },
				--         cargo = {
				--             buildScripts = {
				--                 enable = true,
				--             },
				--         },
				--         procMacro = {
				--             enable = true,
				--         },
				--     },
				-- },
			})
			lspconfig.clangd.setup({ capabilities = capabilities })
			lspconfig.zls.setup({ capabilities = capabilities })
			lspconfig.pylsp.setup({
				flags = {
					debounce_text_changes = 200,
				},
				capabilities = capabilities,
			})
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
