vim.api.nvim_create_autocmd({ "TermOpen", "BufEnter", "BufWinEnter" }, {
	group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
	callback = function()
		if vim.opt.buftype:get() == "terminal" then
			vim.opt.number = false
			vim.opt.relativenumber = false
			vim.cmd.startinsert()
		end
	end,
})

vim.keymap.set("t", "<esc><esc>", "<C-\\><C-n>")

local win_prefix = "<C-w>"

vim.keymap.set("t", vim.fn.join({ win_prefix, "j" }, ""), "<CMD>:wincmd j<CR>")
vim.keymap.set("t", vim.fn.join({ win_prefix, "h" }, ""), "<CMD>:wincmd h<CR>")
vim.keymap.set("t", vim.fn.join({ win_prefix, "k" }, ""), "<CMD>:wincmd k<CR>")
vim.keymap.set("t", vim.fn.join({ win_prefix, "l" }, ""), "<CMD>:wincmd l<CR>")

vim.keymap.set("t", vim.fn.join({ win_prefix, "<c-j>" }, ""), "<CMD>:wincmd j<CR>")
vim.keymap.set("t", vim.fn.join({ win_prefix, "<c-h>" }, ""), "<CMD>:wincmd h<CR>")
vim.keymap.set("t", vim.fn.join({ win_prefix, "<c-k>" }, ""), "<CMD>:wincmd k<CR>")
vim.keymap.set("t", vim.fn.join({ win_prefix, "<c-l>" }, ""), "<CMD>:wincmd l<CR>")

vim.keymap.set("n", vim.fn.join({ win_prefix, "<C-q>" }, ""), "<CMD>:bdelete!<CR>")
vim.keymap.set("n", vim.fn.join({ win_prefix, "q" }, ""), "<CMD>:bdelete!<CR>")
vim.keymap.set("n", vim.fn.join({ win_prefix, "c" }, ""), "<CMD>:bdelete!<CR>")
vim.keymap.set("n", vim.fn.join({ win_prefix, "to" }, ""), ":tabnew<CR>")
vim.keymap.set("n", vim.fn.join({ win_prefix, "tn" }, ""), ":tabN<CR>")
vim.keymap.set("n", vim.fn.join({ win_prefix, "tp" }, ""), ":tabp<CR>")

vim.keymap.set("n", vim.fn.join({ win_prefix, "tb" }, ""), function()
	vim.cmd.vnew()
	vim.cmd.term()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0, 8)
end)

vim.keymap.set("n", vim.fn.join({ win_prefix, "tl" }, ""), function()
	vim.cmd.vnew()
	vim.cmd.term()
	vim.cmd.wincmd("L")
end)

vim.keymap.set("n", vim.fn.join({ win_prefix, "tt" }, ""), function()
	vim.cmd.tabnew()
	vim.cmd.term()
end)

return {
	"akinsho/bufferline.nvim",
	config = function()
		vim.opt.termguicolors = true
		require("bufferline").setup({
			options = {
                style_preset = require("bufferline").style_preset.no_bold,
                show_buffer_close_icons = false,
				mode = "tabs",
                always_show_bufferline = false,
                auto_toggle_bufferline = true,
                indicator = {
                    style = "none"
                }
			},
		})
	end,
}
