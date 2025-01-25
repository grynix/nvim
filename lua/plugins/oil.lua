return {
	"stevearc/oil.nvim",
	opts = {
		default_file_explorer = false,
		delete_to_trash = true,
		skip_confirm_for_simple_edits = true,
		keymaps = {
			["<CR>"] = function()
				local oil = require("oil")
				oil.select({ close = true }, function()
					local bufType = vim.bo.filetype
					if bufType ~= "oil" then
						require("neo-tree.command").execute({ action = "show", dir = require("lazyvim.util").root() })
					end
				end)
			end,
			["gu"] = "actions.parent",
			["q"] = "actions.close",
			["<BS>"] = "actions.parent",
		},
	},
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },
	enabled = true,
}
