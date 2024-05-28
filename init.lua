local os_info = vim.loop.os_uname()

local function map(mode, lhs, rhs, opts)
	vim.keymap.set(mode, lhs, rhs, opts)
end

if vim.g.neovide then
	vim.keymap.set("v", "<D-c>", '"+y') -- Copy
	vim.keymap.set("n", "<D-v>", '"+p') -- Paste normal mode
	vim.keymap.set("v", "<D-v>", '"+p') -- Paste visual mode
	vim.keymap.set("c", "<D-v>", "<C-R>+") -- Paste command mode
	vim.keymap.set("i", "<D-v>", '<C-o>"+P') -- Paste insert mode
	vim.g.neovide_scroll_animation_length = 0
	vim.g.neovide_cursor_animation_length = 0
elseif os_info.sysname == "Darvin" then
	vim.keymap.set("v", "<M-y>", '"+y') -- Copy
	-- window size change
	map("n", "<M-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
	map("n", "<M-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
	map("n", "<M-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
	map("n", "<M-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })
	-- save file
	map("n", "<M-s>", "<cmd>w<cr>", { desc = "Save file" })
	map("i", "<M-s>", "<cmd>w<cr>", { desc = "Save file" })
else
	vim.keymap.set("v", "<C-c>", '"+y') -- Copy
	vim.keymap.set("n", "<M-v>", '"+p') -- Paste normal mode
	vim.keymap.set("v", "<M-v>", '"+p') -- Paste visual mode
	vim.keymap.set("c", "<M-v>", "<C-R>+") -- Paste command mode
	-- window size
	-- done
	--
	-- save file
	-- done
end

require("config.lazy")
