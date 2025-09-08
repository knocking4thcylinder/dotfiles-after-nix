vim.api.nvim_create_autocmd({ "TermOpen", "BufEnter", "BufWinEnter" }, {
	group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
	callback = function()
		if vim.opt.buftype:get() == "terminal" then
			vim.opt.number = false
			vim.opt.relativenumber = false
			vim.wo.scrolloff = 0
			vim.cmd.startinsert()
		end
	end,
})

vim.api.nvim_create_autocmd({ "WinNew", "BufEnter", "WinEnter", "BufWinEnter", "VimResized" }, {
	group = vim.api.nvim_create_augroup("VCenterCursor", { clear = true }),
	callback = function()
		local win = vim.api.nvim_get_current_win()
		local height = vim.api.nvim_win_get_height(win)
		vim.wo.scrolloff = vim.fn.max({ height - (36 * 3 / 4), 1 })
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

vim.keymap.set({ "n", "v" }, "<leader>cwd", function()
	if vim.opt.filetype:get() == "oil" then
		local fname = vim.fn.bufname()
		local dir = string.match(fname, "oil://(.*)")
		vim.fn.chdir(dir)
        -- vim.fn.highlightID
        print(vim.fn.printf("set cwd to %s", dir))
	end
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
					style = "none",
				},
			},
		})
	end,
}
