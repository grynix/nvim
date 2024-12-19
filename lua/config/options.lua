-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.guicursor = {
	"n:block",
	"v-ve:hor50",
	"i-c-ci:hor35",
	"r-cr:hor20",
	"o:hor35",
	"i:blinkwait100-blinkoff400-blinkon400-Cursor/lCursor",
	"sm:block-blinkwait175-blinkoff150-blinkon175",
}
vim.o.guifont = "JetBrainsMono Nerd Font Mono:h16"
vim.g.neovide_scale_factor = 1.0

vim.opt.tabstop = 2
vim.opt.softtabstop = 0
vim.opt.shiftwidth = 2
vim.opt.expandtab = false
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.clipboard = ""

vim.opt.scrolloff = 5
vim.g.VM_theme = "paper"

vim.opt.conceallevel = 0

vim.g.snacks_animate = false
vim.g.ai_cmp = false
