vim.keymap.set("v", "<D-c>", '"+y') -- Copy
vim.keymap.set("n", "<D-v>", '"+p') -- Paste normal mode
vim.keymap.set("v", "<D-v>", '"+p') -- Paste visual mode
vim.keymap.set("c", "<D-v>", "<C-R>+") -- Paste command mode
vim.keymap.set("i", "<D-v>", '<C-o>"+p') -- Paste insert mode

if vim.g.neovide then
	vim.g.neovide_cursor_animation_length = 0
end

require("config.lazy")
