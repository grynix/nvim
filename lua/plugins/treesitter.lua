-- NOTE: treesitter-modules.nvim was removed here: it targets nvim-treesitter's
-- "main" rewrite branch, while LazyVim 14.x pins the archived "master" branch,
-- so it errored on every startup and its incremental_selection never attached.
-- Incremental selection is provided by the nvim-treesitter opts below instead.
return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<CR>",
					node_incremental = "<CR>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
		},
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		opts = {
			enable = true,
			max_lines = 4,
			min_window_height = 0,
			line_numbers = true,
			multiline_threshold = 20,
			trim_scope = "outer",
			mode = "cursor",
			separator = nil,
			zindex = 20,
			on_attach = nil,
		},
	},
}
