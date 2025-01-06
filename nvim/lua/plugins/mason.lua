return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"pylsp",
					"clangd",
					"rust_analyzer",
					"zls",
				},
			})
		end,
	},
}
