local M = {}

M.diffview_open_from_telescope_commits = function()
	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")
	require("telescope.builtin").git_commits({
		prompt_title = "Select commit to compare",
		initial_mode = "normal",
		limit = 50,
		attach_mappings = function(_, map)
			map("i", "<CR>", function(bufnr)
				local selection = action_state.get_selected_entry()
				actions.close(bufnr)
				vim.cmd("DiffviewOpen " .. selection.value .. "..HEAD")
			end)
			return true
		end,
	})
end

M.diffview_open_from_telescope_branches = function()
	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")
	require("telescope.builtin").git_branches({
		prompt_title = "Select commit to compare",
		initial_mode = "normal",
		limit = 50,
		attach_mappings = function(_, map)
			map("i", "<CR>", function(bufnr)
				local selection = action_state.get_selected_entry()
				actions.close(bufnr)
				vim.cmd("DiffviewOpen " .. selection.value .. "..HEAD")
			end)
			return true
		end,
	})
end

return M
