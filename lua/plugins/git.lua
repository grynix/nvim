return {
	"NeogitOrg/neogit",
	cmd = { "Neogit", "NeogitCommit", "NeogitLogCurrent", "NeogitResetState" },
	dependencies = {
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = true,
}
