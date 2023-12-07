return {
	"huynle/ogpt.nvim",
	event = "VeryLazy",
	config = function()
		require("ogpt").setup()
	end,
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
}
