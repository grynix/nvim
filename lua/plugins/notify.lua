return {
	"rcarriga/nvim-notify",
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
