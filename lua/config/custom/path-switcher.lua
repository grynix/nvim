local M = {}

function M.switch_path()
	-- Get the current file path
	local current_path = vim.fn.expand("%:p")

	-- Open a new split with a prompt to edit the path
	vim.cmd("split")
	vim.cmd("enew")
	vim.cmd("setlocal buftype=nofile")
	vim.cmd("setlocal bufhidden=wipe")
	vim.cmd("setlocal noswapfile")
	vim.cmd("normal! i" .. current_path)

	-- Map <CR> to switch to the new path
	vim.api.nvim_buf_set_keymap(
		0,
		"n",
		"<CR>",
		[[<cmd>lua require('config.custom.path-switcher').jump_to_new_path()<CR>]],
		{ noremap = true, silent = true }
	)
end

function M.jump_to_new_path()
	-- Get the new path from the buffer
	local new_path = vim.fn.getline(1)
	vim.cmd("bd!") -- Close the temporary buffer

	-- Open the file at the new path
	vim.cmd("edit " .. new_path)
end

return M
