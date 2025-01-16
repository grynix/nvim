return {
	"echasnovski/mini.bufremove",
	lazy = true,
	event = "VeryLazy",
	keys = function()
		return {
			{
				"<M-w>",
				function()
					require("mini.bufremove").delete(0, false)
				end,
				desc = "Delete Buffer",
			},
			{
				"<leader>bW",
				function()
					require("mini.bufremove").delete(0, true)
				end,
				desc = "Delete Buffer (Force)",
			},
		}
	end,
}
