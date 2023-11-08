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
   require("conform").format({ async = true, lsp_fallback = true })
end

vim.keymap.set("n", "<F8>", "<cmd>TagbarOpenAutoClose<CR>")
--  vim.keymap.set('n', '<leader>cz', format, { noremap = true, silent = true })
--  vim.cmd [[ autocmd InsertLeave * lua on_insert_leave() ]]

-- vim.api.nvim_set_keymap('i', '<esc>', format, { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('i', '<esc>', '<cmd>lua format_and_return_to_normal()<CR>', { noremap = true, silent = true })
vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, { desc = "Rename File", buffer = buffer })

vim.keymap.set("n", "<D-s>", vim.cmd.w)
vim.keymap.set("i", "<D-s>", vim.cmd.w)

map("n", "<D-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<D-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<D-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<D-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- windows
map("n", "<leader>wb", "<C-W>p", { desc = "Other window", remap = true })
map("n", "<leader>ww", "<C-W>c", { desc = "Delete window", remap = true })
map("n", "<D-x>", "<C-W>c", { desc = "Delete window", remap = true })
map("n", "<leader>w`", "<C-W>s", { desc = "Split window below", remap = true })
map("n", "<leader>w\\", "<C-W>v", { desc = "Split window right", remap = true })
map("n", "<leader>`", "<C-W>s", { desc = "Split window below", remap = true })
map("n", "<leader>\\", "<C-W>v", { desc = "Split window right", remap = true })

map("n", "<M-Down>", "<cmd>m .+1<CR>==", { desc = "Shift row Down." })
map("i", "<M-Down>", "<cmd>m .+1<CR><esc>==i", { desc = "Shift row Down." })
map("n", "<M-Up>", "<cmd>m .-2<CR>==", { desc = "Shift row Up." })
map("i", "<M-Up>", "<cmd>m .-2<CR><esc>==i", { desc = "Shift row Up." })

map("n", "<D-j>", "<cmd>exe 'normal! o'<CR>", { desc = "Empty line below" })
map("i", "<D-j>", "<cmd>exe 'normal! o'<CR>", { desc = "Empty line below" })
map("n", "<D-k>", "<cmd>exe 'normal! O'<CR>", { desc = "Empty line above" })
map("i", "<D-k>", "<cmd>exe 'normal! O'<CR>", { desc = "Empty line above" })

map("n", "<D-d>", "*N//e<CR>", { desc = "Selects word" })
map("n", "<D-f>", "*N//", { desc = "Search for word" })

map("n", ';"', 'ciw""<esc>P', { desc = "Wraps word in quotes." })
map("n", ";'", "ciw''<esc>P", { desc = "Wraps word in quotes." })
map("n", ";(", "ciw()<esc>P", { desc = "Wraps word in ()." })
map("n", ";{", "ciw{}<esc>P", { desc = "Wraps word in {}." })
map("n", ";[", "ciw[]<esc>P", { desc = "Wraps word in {}." })
map("v", ';"', 'c""<esc>P', { desc = "Wraps word in quotes." })
map("v", ";'", "c''<esc>P", { desc = "Wraps word in quotes." })
map("v", ";(", "c()<esc>P", { desc = "Wraps word in ()." })
map("v", ";{", "c{}<esc>P", { desc = "Wraps word in {}." })
map("v", ";[", "c[]<esc>P", { desc = "Wraps word in {}." })

map("n", "<leader>cp", "<cmd>CreatePrettierRC<CR>", { desc = "Creates a .prettierrc file" })
