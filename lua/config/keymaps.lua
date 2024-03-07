-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function map(mode, lhs, rhs, opts)
	vim.keymap.set(mode, lhs, rhs, opts)
end

map("n", "j", "j", { silent = true })
map("n", "k", "k", { silent = true })

-- Define the global format function
-- HACK: is this still being used?
_G.conform_format_on_leave = function()
	-- NOTE: if this is changed to:
	-- require("lazyvim.util").format({ force = true })
	-- the {} will break, do not change it to that
	require("conform").format({ async = true, lsp_fallback = true })
end

vim.keymap.set("n", "<F8>", "<cmd>AerialNavToggle<CR>")
--  vim.keymap.set('n', '<leader>cz', format, { noremap = true, silent = true })
--  vim.cmd [[ autocmd InsertLeave * lua on_insert_leave() ]]

-- vim.api.nvim_set_keymap('i', '<esc>', format, { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('i', '<esc>', '<cmd>lua format_and_return_to_normal()<CR>', { noremap = true, silent = true })

map("n", "<D-s>", "<cmd>w<cr>", { desc = "Save file" })
map("i", "<D-s>", "<cmd>w<cr>", { desc = "Save file" })

-- window size change
map("n", "<D-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<D-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<D-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<D-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

map("n", "gb", "%", { desc = "Go to bracket. Acts as %" })

-- windows
map("n", "<leader>wb", "<C-W>p", { desc = "Other window", remap = true })
map("n", "<leader>ww", "<C-W>c", { desc = "Delete window", remap = true })
map("n", "<D-x>", "<C-W>c", { desc = "Delete window", remap = true })
map("n", "<D-b>", "<C-W>h<C-W>c", { desc = "Close left window", remap = true })
map("n", "<leader>w`", "<C-W>s", { desc = "Split window below", remap = true })
map("n", "<leader>w\\", "<C-W>v", { desc = "Split window right", remap = true })
map("n", "<leader>`", "<C-W>s", { desc = "Split window below", remap = true })
map("n", "<leader>\\", "<C-W>v", { desc = "Split window right", remap = true })

map("n", "<M-Down>", "<cmd>m .+1<CR>==", { desc = "Shift row Down." })
map("i", "<M-Down>", "<cmd>m .+1<CR><esc>==i", { desc = "Shift row Down." })
map("n", "<M-Up>", "<cmd>m .-2<CR>==", { desc = "Shift row Up." })
map("i", "<M-Up>", "<cmd>m .-2<CR><esc>==i", { desc = "Shift row Up." })

-- Git
map("n", "<leader>gg", "<cmd>Neogit<CR>", { desc = "Neogit" })
map("n", "<leader>git", "<cmd>LazyGit<CR>", { desc = "LazyGit" })
map("n", "<leader>gdt", "<cmd>diffthis<CR>", { desc = "Diff this", remap = true })
map("n", "<leader>gf", "<cmd>Neotree float git_status<CR>", { desc = "Neotree: git_status" })
map("n", "<D-g>", "<cmd>Telescope git_status initial_mode=normal<CR>", { desc = "Telescope: git_status", remap = true })
map("n", "<D-b>", "<cmd>Git blame_line<CR>", { desc = "Toggle Current Line Blame" })
map("n", "<D-B>", "<cmd>Git toggle_current_line_blame<CR>", { desc = "Toggle Current Line Blame" })
map(
	"n",
	"<leader>gdc",
	require("config.custom.mydiff").diffview_open_from_telescope_commits,
	{ desc = "Compare a range of commits" }
)
map(
	"n",
	"<leader>gdb",
	require("config.custom.mydiff").diffview_open_from_telescope_branches,
	{ desc = "Compare a to a branch" }
)
map("n", "<leader>gdd", "<cmd>DiffviewOpen<CR>", { desc = "Open diffview for not commited files" })
map("n", "<leader>ghf", "<cmd>DiffviewFileHistory %<CR>", { desc = "Open file history for current file" })
map("n", "<leader>ghh", "<cmd>DiffviewFileHistory<CR>", { desc = "Open file history for project" })

-- CMD keys
map("n", "<D-j>", "<cmd>exe 'normal! o'<CR>", { desc = "Empty line below" })
map("i", "<D-j>", "<C-o>o", { desc = "Empty line below" })

map("n", "<D-k>", "<cmd>exe 'normal! O'<CR>", { desc = "Empty line above" })
map("i", "<D-k>", "<cmd>exe 'normal! O'<CR>", { desc = "Empty line above" })

map("n", "<D-o>", "yyp", { desc = "Duplicate current line" })
map("i", "<D-o>", "<ESC>yypA", { desc = "Duplicate current line" })
map("v", "<D-o>", "d2P", { desc = "Duplicate current line" })

map("n", "<D-p>", "a<CR><CR><UP><C-o>p<ESC><cmd>LazyFormat<CR>", { desc = "Paste after in new line" })

map("v", "<C-p>", "p", { desc = "Paste and change the register for what we replaced" })
map("v", "p", '"_xP', { desc = "Paste without changing the register" })

map("n", "J", "i<CR><CR><UP><TAB><C-o>", { desc = "enter" })

-- 'a' registry
map("n", "<D-t>", 'v"aiwp', { desc = "Paste the current word from 'a' registry" })
map("n", "<D-y>", '"ayiw', { desc = "Yank word into 'a' registry" })
map("v", "<D-y>", '"ay', { desc = "Yank into 'a' registry" })

map("n", "x", '"_x', { desc = "x into 'b' buffer" })
map("n", "X", "viwp", { desc = "Replace the current word with content from regular registry" })
map("v", "x", '"_x', { desc = "x into 'b' buffer" })

-- Spectre / word search
map("n", "<D-f>g", function()
	require("spectre").open_visual({ select_word = true })
end, { desc = "Search current word globally" })

map("n", "<D-f>l", function()
	require("spectre").open_file_search({ select_word = true })
end, { desc = "Search current word in current file" })

map("n", "<D-f>d", function()
	require("spectre").toggle()
end, { desc = "Toggle word search" })

map("n", "<D-f>b", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Telescope in current buffer" })

map("v", "<D-f>", ":'<,'>lua require('spectre').open_visual()<CR>", { desc = "Search selected word globally" })

map("n", "<D-d>", "*N//", { desc = "Search for word", remap = true })
map("n", "<leader>sb", "<cmd>Telescope buffers initial_mode=normal<CR>", { desc = "Search in buffers" })

map("n", "<F4>", "<cmd>LazyFormat<CR>", { desc = "Format document" })
map("i", "<F4>", "<cmd>LazyFormat<CR>", { desc = "Format document" })

--

map("n", '\\"', 'ciw""<esc>P', { desc = "Wraps word in quotes." })
map("v", '\\"', 'c""<esc>P', { desc = "Wraps in quotes." })
map("n", "\\(", "ciw()<esc>P", { desc = "Wraps word in ()." })
map("v", "\\(", "c()<esc>P", { desc = "Wraps in ()." })
map("n", "\\'", "ciw''<esc>P", { desc = "Wraps word in quotes." })
map("v", "\\'", "c''<esc>P", { desc = "Wraps in quotes." })
map("n", "\\{", "ciw{}<esc>P", { desc = "Wraps word in {}." })
map("v", "\\{", "c{}<esc>P", { desc = "Wraps in {}." })
map("n", "\\[", "ciw[]<esc>P", { desc = "Wraps word in {}." })
map("v", "\\[", "c[]<esc>P", { desc = "Wraps in {}." })
map("n", "\\`", "ciw``<esc>P", { desc = "Wraps word in ``." })
map("v", "\\`", "c``<esc>P", { desc = "Wraps in ``." })

local function getInput()
	local char = vim.fn.getchar()
	if type(char) == "number" then
		char = vim.fn.nr2char(char)
	end

	if char == '"' then
		char = '\\"'
	end
	return char
end

map("n", "\\<F2>", function()
	local char = getInput()

	if char then
		vim.api.nvim_command('exe "normal! ciw' .. char .. char .. '\\<Esc>P"')
	else
		print("No input captured")
	end
end, { desc = "wrap/surround word in something" })

map("v", "\\<F2>", function()
	local char = getInput()

	if char then
		vim.api.nvim_command('exe "normal! c' .. char .. char .. '\\<Esc>P"')
	else
		print("No input captured")
	end
end, { desc = "wrap/surround selected in something" })

map("n", "<Leader>\\<F2>", function()
	local function evaluateBracket(str)
		local brackets = { "()", "{}", "[]", "<>" }
		for _, v in ipairs(brackets) do
			if string.sub(v, 1, 1) == str then
				return true, v
			end
		end
		return false, str
	end

	local char = getInput()

	if char then
		local newChar = getInput()
		vim.api.nvim_command('exe "normal! di' .. char .. '"')
		if newChar then
			local isBracket, bracket = evaluateBracket(newChar)

			if isBracket then
				vim.api.nvim_command('exe "normal! va' .. char .. '\\"_c' .. bracket .. '\\<esc>P"')
			else
				vim.api.nvim_command('exe "normal! va' .. char .. '\\"_c' .. newChar .. newChar .. '\\<esc>P"')
			end
		end
	else
		print("No input captured")
	end
end, { desc = "delete wrap around and wrap inside something else" })

map("n", "<leader>\\\\", function()
	local char = getInput()
	vim.api.nvim_command('exe "normal! di' .. char .. '"')
	vim.api.nvim_command('exe "normal! va' .. char .. '\\"_d' .. 'p"')
end, { desc = "Remove sorrounding characters" })

map("n", "<leader>uP", "<cmd>CreatePrettierRC<CR>", { desc = "Creates a .prettierrc file" })

map("n", "<leader>p", "<cmd>let @+ = expand('%:p')<CR>", { desc = "get current file's path" })

map("n", "<S-PageUp>", "<C-u>", { desc = "up" })
map("n", "<S-PageDown>", "<C-d>", { desc = "dwob" })

map("n", "<leader>u+", function()
	vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.07
	vim.api.nvim_command('exe "normal! jk"')
end, { desc = "Increase font size" })

map("n", "<leader>u-", function()
	vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.07
	vim.api.nvim_command('exe "normal! jk"')
end, { desc = "Desrease font size" })

map("n", "<leader>u=", function()
	vim.g.neovide_scale_factor = 1.0
end, { desc = "Reset font size" })
