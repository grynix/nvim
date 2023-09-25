-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Set up the autocommand to run the function when leaving insert mode
vim.cmd([[ autocmd InsertLeave * lua _G.format_on_leave() ]])
