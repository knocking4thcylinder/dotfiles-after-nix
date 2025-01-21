return {
	"echasnovski/mini.nvim",
    version = false,
    config = function()
        require("mini.statusline").setup()
        require("mini.pairs").setup()
        require("mini.git").setup()
        require("mini.files").setup()
    end,
}
