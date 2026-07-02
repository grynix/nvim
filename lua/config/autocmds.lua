-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Set up the autocommand to run the function when leaving insert mode
-- vim.cmd([[ autocmd InsertLeave * lua _G.conform_format_on_leave() ]])

-- Autosave on BufLeave, but only for real, modified file buffers. The guards
-- keep :update away from special buffers (oil, telescope, neogit, terminals),
-- where BufWriteCmd side effects would fire — e.g. oil would silently apply
-- pending file operations just because you left its buffer.
vim.api.nvim_create_autocmd("BufLeave", {
	group = vim.api.nvim_create_augroup("autosave_on_leave", { clear = true }),
	callback = function(ev)
		if
			vim.bo[ev.buf].buftype == ""
			and vim.bo[ev.buf].modifiable
			and vim.bo[ev.buf].modified
			and vim.api.nvim_buf_get_name(ev.buf) ~= ""
		then
			vim.cmd("silent! update")
		end
	end,
})

local function create_prettierrc()
	local prettierrc_path = vim.fn.getcwd() .. "/.prettierrc"

	if vim.fn.filereadable(prettierrc_path) == 1 then
		print(".prettierrc already exists")
		return
	end

	local default_config = [[
{
  "semi": false,
  "singleQuote": false,
  "trailingComma": "es5",
  "printWidth": 80,
  "tabWidth": 3,
  "useTabs": true
}
]]

	local file = io.open(prettierrc_path, "w")
	if file then
		file:write(default_config)
		file:close()
		print("Created .prettierrc with default configuration")
	else
		print("Error creating .prettierrc")
	end
end

local function formatNotTelescope()
	local bufType = vim.bo.filetype
	if bufType ~= "TelescopePrompt" and bufType ~= "go" then
		vim.cmd("LazyFormat")
	end
end

vim.api.nvim_create_user_command("CreatePrettierRC", create_prettierrc, {})
vim.api.nvim_create_user_command("FormatIfNotTelescopeBuffer", formatNotTelescope, {})
