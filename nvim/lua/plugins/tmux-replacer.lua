vim.api.nvim_create_autocmd({ "TermOpen", "BufEnter", "BufWinEnter" }, {
	group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
	callback = function()
		if vim.opt.buftype:get() == "terminal" then
			vim.opt.number = false
			vim.opt.relativenumber = false
			vim.cmd(":startinsert")
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

vim.keymap.set("n", "<leader>tb", function()
	vim.cmd.vnew()
	vim.cmd.term()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0, 8)
end)

vim.keymap.set("n", "<leader>tt", function()
	vim.cmd.tabnew()
	vim.cmd.term()
end)

return {}
