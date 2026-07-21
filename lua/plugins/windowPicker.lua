return {
	"s1n7ax/nvim-window-picker",
	name = "window-picker",
	-- loads on require("window-picker"), i.e. when neo-tree first uses it
	lazy = true,
	version = "2.*",
	config = function()
		require("window-picker").setup({
			hint = "floating-big-letter",
		})
	end,
}
