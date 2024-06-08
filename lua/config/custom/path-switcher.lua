local M = {}

function M.switch_path()
	-- Get the current file path
	local current_path = vim.fn.expand("%:p")

	-- Calculate the size and position of the floating window
	local width = math.floor(vim.o.columns * 0.8)
	local height = 1
	local row = math.floor((vim.o.lines - height) / 2)
	local col = math.floor((vim.o.columns - width) / 2)

	-- Create a buffer for the floating window
	local buf = vim.api.nvim_create_buf(false, true)

	-- Set the options for the buffer
	vim.api.nvim_set_option_value("bufhidden", "wipe", { buf = buf })
	vim.api.nvim_set_option_value("buftype", "nofile", { buf = buf })

	-- Create the floating window
	local win = vim.api.nvim_open_win(buf, true, {
		relative = "editor",
		width = width,
		height = height,
		row = row,
		col = col,
		style = "minimal",
		border = "rounded",
	})

	-- Set the current path in the buffer and enter insert mode
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, { current_path })
	vim.cmd("normal! $")

	-- Map <CR> to switch to the new path and close the floating window
	vim.api.nvim_buf_set_keymap(
		buf,
		"i",
		"<CR>",
		[[<cmd>lua require('config.custom.path-switcher').jump_to_new_path()<CR><esc>]],
		{ noremap = true, silent = true }
	)
	vim.api.nvim_buf_set_keymap(
		buf,
		"n",
		"<CR>",
		[[<cmd>lua require('config.custom.path-switcher').jump_to_new_path()<CR>]],
		{ noremap = true, silent = true }
	)

	vim.api.nvim_buf_set_keymap(
		buf,
		"n",
		"<Esc>",
		[[<cmd>lua require('config.custom.path-switcher').close_floating_win()<CR>]],
		{ noremap = true, silent = true }
	)
	vim.api.nvim_buf_set_keymap(
		buf,
		"n",
		"q",
		[[<cmd>lua require('config.custom.path-switcher').close_floating_win()<CR>]],
		{ noremap = true, silent = true }
	)
end

function M.jump_to_new_path()
	-- Get the new path from the buffer
	-- local buf = vim.api.nvim_get_current_buf()
	-- local new_path = vim.api.nvim_buf_get_lines(buf, 0, -1, false)[0]

	local new_path = vim.fn.getline(1)

	-- Close the floating window
	vim.api.nvim_win_close(0, true)

	-- Open the file at the new path
	vim.cmd("edit " .. new_path)
end

function M.close_floating_win()
	-- Close the floating window without action
	vim.api.nvim_win_close(0, true)
end

return M
