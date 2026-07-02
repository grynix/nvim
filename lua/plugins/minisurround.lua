return {
	"nvim-mini/mini.surround",
	-- lazy-load stubs for the mappings configured below (safe: flash.nvim's
	-- default s/S keys are disabled in flash.lua)
	keys = {
		{ "s", mode = { "n", "x" }, desc = "Add Surrounding" },
		{ "S", desc = "Delete Surrounding" },
		{ "SS", desc = "Replace Surrounding" },
	},
	opts = {
		mappings = {
			add = "s", -- Add surrounding in Normal and Visual modes
			delete = "S", -- Delete surrounding
			replace = "SS", -- Replace surrounding
			-- find = "Sf", -- Find surrounding (to the right)
			-- find_left = "SF", -- Find surrounding (to the left)
			-- highlight = "Sh", -- Highlight surrounding
			-- update_n_lines = "Sn", -- Update `n_lines`
		},
	},
}
