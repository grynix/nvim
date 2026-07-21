return {
	-- nvim-treesitter's main branch (what LazyVim now uses) dropped the module
	-- system entirely, so it has no incremental selection. treesitter-modules.nvim
	-- re-implements that module for the main branch. Loaded on file open (not at
	-- startup) so it stays off the startup path.
	{
		"MeanderingProgrammer/treesitter-modules.nvim",
		event = { "LazyFile", "VeryLazy" },
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		opts = {
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<CR>", -- normal mode: start selection
					node_incremental = "<CR>", -- visual: grow to parent node
					scope_incremental = false,
					node_decremental = "<bs>", -- visual: shrink to child node
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
