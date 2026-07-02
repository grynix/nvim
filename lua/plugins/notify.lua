return {
	"rcarriga/nvim-notify",
	-- loads on require("notify"), i.e. when noice first renders a notification
	lazy = true,
	opts = {
		stages = "slide",
		timeout = 2500,
		fps = 60,
		position = "bottom_right",
		icons = {
			ERROR = "",
			WARN = "",
			INFO = "",
			DEBUG = "",
			TRACE = "✎",
		},
		render = "compact",
		top_down = false,
	},
}
