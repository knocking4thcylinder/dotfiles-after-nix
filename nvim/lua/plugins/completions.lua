---@diagnostic disable: missing-fields
return {
	{
		"xzbdmw/colorful-menu.nvim",
		config = function()
			-- You don't need to set these options.
			require("colorful-menu").setup({})
		end,
	},
	{
		event = "InsertEnter",
		"saghen/blink.cmp",
		dependencies = {
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
		},

		version = "1.*",
		opts = {
			keymap = {
				preset = "default",
			},

			appearance = {
				nerd_font_variant = "mono",
			},
			cmdline = {
				keymap = {
					["<Tab>"] = { "select_and_accept" },
					-- ["<CR>"] = { "accept_and_enter" },
				},
				completion = { menu = { auto_show = true } },
			},
			completion = {
				trigger = {
					show_on_trigger_character = true,
					show_on_blocked_trigger_characters = function(_)
						if vim.bo.filetype == "rust" then
							return { " ", "\n", "\t" }
						end
						return { "\n", " ", "\t", ":" }
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
				default = { "lazydev", "lsp", "path", "snippets", "buffer" },
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						-- make lazydev completions top priority (see `:h blink.cmp`)
						score_offset = 100,
					},
				},
			},
			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},
}
