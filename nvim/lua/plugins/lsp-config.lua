return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- "nvim-cmp"
		},
		config = function()
			local lspconfig = require("lspconfig")
			-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			lspconfig.fish_lsp.setup({})

			lspconfig.kotlin_language_server.setup({ capabilities = capabilities })
			lspconfig.bashls.setup({ capabilities = capabilities })
			lspconfig.hyprls.setup({ capabilities = capabilities })
			lspconfig.gopls.setup({ capabilities = capabilities })
			lspconfig.html.setup({ capabilities = capabilities })
			lspconfig.lua_ls.setup({ capabilities = capabilities })
			lspconfig.lemminx.setup({ capabilities = capabilities })
			lspconfig.cssls.setup({ capabilities = capabilities })
			lspconfig.hls.setup({ capabilities = capabilities })
			lspconfig.elixirls.setup({ capabilities = capabilities, cmd = { "elixir-ls" } })
			lspconfig.jdtls.setup({ capabilities = capabilities })
			lspconfig.rust_analyzer.setup({
                capabilities = capabilities,
				on_attach = function(client, bufnr)
				    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
				end,
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
