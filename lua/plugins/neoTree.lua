return {
	"nvim-neo-tree/neo-tree.nvim",
	opts = {
		filesystem = {
			-- hijack_netrw_behavior = "open_default",
			hijack_netrw_behavior = "open_current",
			-- hijack_netrw_behavior = "disabled",
		},
		window = {
			position = "left",
			width = 35,
		},
	},
}
