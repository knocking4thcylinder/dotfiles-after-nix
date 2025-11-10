return {
	"christoomey/vim-tmux-navigator",
	cmd = {
		"TmuxNavigateLeft",
		"TmuxNavigateDown",
		"TmuxNavigateUp",
		"TmuxNavigateRight",
		"TmuxNavigatePrevious",
	},
	keys = {
		{ "<c-h>", "<cmd>TmuxNavigateLeft<cr>" },
		{ "<c-w>h", "<cmd>TmuxNavigateLeft<cr>" },
		{ "<c-w>H", "<cmd>TmuxNavigateLeft<cr>" },

		{ "<c-j>", "<cmd>TmuxNavigateDown<cr>" },
		{ "<c-w>j", "<cmd>TmuxNavigateDown<cr>" },
		{ "<c-w>J", "<cmd>TmuxNavigateDown<cr>" },

		{ "<c-k>", "<cmd>TmuxNavigateUp<cr>" },
		{ "<c-w>k", "<cmd>TmuxNavigateUp<cr>" },
		{ "<c-w>K", "<cmd>TmuxNavigateUp<cr>" },

		{ "<c-l>", "<cmd>TmuxNavigateRight<cr>" },
		{ "<c-w>l", "<cmd>TmuxNavigateRight<cr>" },
		{ "<c-w>L", "<cmd>TmuxNavigateRight<cr>" },

		{ "<c-p>", "<cmd>TmuxNavigatePrevious<cr>" },
		{ "<c-w>p", "<cmd>TmuxNavigatePrevious<cr>" },
		{ "<c-w>P", "<cmd>TmuxNavigatePrevious<cr>" },
	},
}
