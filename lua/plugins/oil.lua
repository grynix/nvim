return {
	"stevearc/oil.nvim",
	opts = {
		default_file_explorer = true,
		delete_to_trash = true,
		skip_confirm_for_simple_edits = true,
		keymaps = {
			["<CR>"] = function()
				local oil = require("oil.actions")
				oil.select({})
				require("neo-tree.command").execute({ show = true, dir = vim.loop.cwd() })
			end,
			["gu"] = "actions.parent",
		},
	},
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },
	enabled = false,
}
