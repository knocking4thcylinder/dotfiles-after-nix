if vim.loader then
	vim.loader.enable()
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
require("vim-cfg")
require("keymaps")
require("lazy").setup("plugins", {
	defaults = { lazy = true }, -- all plugins lazy by default
	ui = { border = "rounded" }, -- optional: nicer UI
})
