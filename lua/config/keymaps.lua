-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function map(mode, lhs, rhs, opts)
	local keys = require("lazy.core.handler").handlers.keys
	---@cast keys LazyKeysHandler
	-- do not create the keymap if a lazy keys handler exists
	if not keys.active[keys.parse({ lhs, mode = mode }).id] then
		opts = opts or {}
		opts.silent = opts.silent ~= false
		if opts.remap and not vim.g.vscode then
			opts.remap = nil
		end
		vim.keymap.set(mode, lhs, rhs, opts)
	end
end

-- vim.api.nvim_set_keymap('n', '<leader>ca', ':lua vim.lsp.buf.code_action()<CR>', { noremap = true, silent = true })

-- local format = function()

--    require("lazyvim.plugins.lsp.format").format({ force = true })
--  end
-- -- Set up the autocommand to run the function when leaving insert mode
-- vim.cmd [[ autocmd InsertLeave * lua format() ]]

-- Define the global format function
_G.conform_format_on_leave = function()
	-- NOTE: if this is changed to:
	-- require("lazyvim.util").format({ force = true })
	-- the {} will break, do not change it to that
	require("conform").format({ async = true, lsp_fallback = true })
end

vim.keymap.set("n", "<F8>", "<cmd>TagbarOpenAutoClose<CR>")
--  vim.keymap.set('n', '<leader>cz', format, { noremap = true, silent = true })
--  vim.cmd [[ autocmd InsertLeave * lua on_insert_leave() ]]

-- vim.api.nvim_set_keymap('i', '<esc>', format, { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('i', '<esc>', '<cmd>lua format_and_return_to_normal()<CR>', { noremap = true, silent = true })
vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, { desc = "Rename File" })

map("n", "<D-s>", vim.cmd.w, { desc = "Save file" })
map("i", "<D-s>", vim.cmd.w, { desc = "Save file" })

-- FIX: This does work but it also triggers autosave save/updated.
vim.keymap.set("n", "<D-u>", vim.cmd.update)
vim.keymap.set("i", "<D-u>", vim.cmd.update)

-- window size change
map("n", "<D-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<D-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<D-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<D-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

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
map("n", "<leader>gh<D-d>", ":Gitsigns diffthis ", { desc = "Diff x commit:", remap = true })
map("n", "<D-g>", "<cmd>Telescope git_status<CR>", { desc = "Telescope: git_status", remap = true })
map("n", "<D-b>", "<cmd>Git blame_line<CR>", { desc = "Toggle Current Line Blame" })
map("n", "<D-B>", "<cmd>Git toggle_current_line_blame<CR>", { desc = "Toggle Current Line Blame" })
map(
	"n",
	"<leader>gd",
	require("config.custom.mydiff").diffview_open_from_telescope,
	{ desc = "Compare a range of commits" }
)
map("n", "<D-d>", "<cmd>DiffviewOpen<CR>", { desc = "Open diffview for not commited files" })
map("n", "<leader>ghh", "<cmd>DiffviewFileHistory %", { desc = "Open file history for current file" })
map("n", "<leader>ghH", "<cmd>DiffviewFileHistory", { desc = "Open file history for project" })

-- CMD keys
map("n", "<D-j>", "<cmd>exe 'normal! o'<CR>", { desc = "Empty line below" })
map("i", "<D-j>", "<cmd>exe 'normal! o'<CR>", { desc = "Empty line below" })

map("n", "<D-k>", "<cmd>exe 'normal! O'<CR>", { desc = "Empty line above" })
map("i", "<D-k>", "<cmd>exe 'normal! O'<CR>", { desc = "Empty line above" })

map("n", "<D-o>", "yyp", { desc = "Duplicate current line" })
map("i", "<D-o>", "<ESC>yypA", { desc = "Duplicate current line" })

map("n", "<D-P>", "viwp", { desc = "Replace with paste the current word from regular registry" })
map("n", "<D-p>", 'v"aiwp', { desc = "Replace with paste the current word from 'a' registry" })
map("n", "<D-p>", "viwp", { desc = "Replace with paste the current word" })

map("n", "<D-y>", '"ayiw', { desc = "Yank word into 'a' registry" })
map("v", "<D-y>", '"ay', { desc = "Yank into 'a' registry" })

map("n", "<D-f>", "*N//", { desc = "Search for word" })

--

map("n", '\\"', 'ciw""<esc>P', { desc = "Wraps word in quotes." })
map("n", "\\'", "ciw''<esc>P", { desc = "Wraps word in quotes." })
map("n", "\\(", "ciw()<esc>P", { desc = "Wraps word in ()." })
map("n", "\\{", "ciw{}<esc>P", { desc = "Wraps word in {}." })
map("n", "\\[", "ciw[]<esc>P", { desc = "Wraps word in {}." })
map("v", '\\"', 'c""<esc>P', { desc = "Wraps in quotes." })
map("v", "\\'", "c''<esc>P", { desc = "Wraps in quotes." })
map("v", "\\(", "c()<esc>P", { desc = "Wraps in ()." })
map("v", "\\{", "c{}<esc>P", { desc = "Wraps in {}." })
map("v", "\\[", "c[]<esc>P", { desc = "Wraps in {}." })

map("n", "<leader>cp", "<cmd>CreatePrettierRC<CR>", { desc = "Creates a .prettierrc file" })
