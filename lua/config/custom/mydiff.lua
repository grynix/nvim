local M = {}

local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

M.diffview_open_from_telescope_commits = function()
	require("telescope.builtin").git_commits({
		prompt_title = "Select commit to compare HEAD to",
		attach_mappings = function(bufnr, map)
			map("n", "<CR>", function()
				local selection = action_state.get_selected_entry()
				-- Debug: Print the selection value to see what it contains
				print("Selected commit: " .. selection.value)
				actions.close(bufnr)
				vim.cmd("DiffviewOpen " .. selection.value .. "..HEAD")
			end)
			return true
		end,
		initial_mode = "normal",
		limit = 50,
	})
end

M.diffview_open_from_telescope_branches = function()
	require("telescope.builtin").git_branches({
		prompt_title = "Select branch to compare HEAD to",
		attach_mappings = function(bufnr, map)
			map("n", "<CR>", function()
				local selection = action_state.get_selected_entry()
				actions.close(bufnr)
				vim.cmd("DiffviewOpen " .. selection.value .. "...HEAD")
			end)
			return true
		end,
		initial_mode = "normal",
		limit = 50,
	})
end

return M
