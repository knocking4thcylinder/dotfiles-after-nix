return {
	"echasnovski/mini.nvim",
	version = false,
	config = function()
		require("mini.statusline").setup()
		require("mini.pairs").setup()
		require("mini.git").setup()
		require("mini.files").setup({ windows = { border = "rounded" } })
		vim.keymap.set("n", "<C-n>", "<CMD>lua MiniFiles.open()<CR>")
		require("mini.notify").setup()
		require("mini.surround").setup()
		require("mini.operators").setup()
		require("mini.comment").setup()
		require("mini.starter").setup()
	end,
}
