vim.keymap.set("v", "<D-c>", '"+y') -- Copy
vim.keymap.set("n", "<D-v>", '"+P') -- Paste normal mode
vim.keymap.set("v", "<D-v>", '"+P') -- Paste visual mode
vim.keymap.set("c", "<D-v>", "<C-R>+") -- Paste command mode
vim.keymap.set("i", "<D-v>", '<ESC>l"+Pli') -- Paste insert mode

require("config.lazy")

-- vim.opt.tabstop = 3
-- vim.opt.softtabstop = 3
-- vim.opt.shiftwidth = 3
-- vim.opt.expandtab = false
-- vim.opt.autoindent = true
-- vim.opt.smartindent = true
-- vim.opt.clipboard = ""
