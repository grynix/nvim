-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.guicursor = {
   "n-v:block",
   "i-c-ci-ve:hor35",
   "r-cr:hor20",
   "o:hor50",
   "i:blinkwait100-blinkoff400-blinkon400-Cursor/lCursor",
   "sm:block-blinkwait175-blinkoff150-blinkon175",
}
vim.o.guifont = "JetBrainsMono Nerd Font Mono:h16"
vim.g.neovide_scale_factor = 1.0

vim.opt.tabstop = 3
vim.opt.softtabstop = 3
vim.opt.shiftwidth = 3
vim.opt.expandtab = false
vim.opt.autoindent = true
vim.opt.smartindent = true
