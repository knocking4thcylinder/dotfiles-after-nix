return {
	"kevinhwang91/nvim-fundo",
	dependencies = {
		"kevinhwang91/promise-async",
	},
	config = function()
		require("fundo").install()
	end,
}
