return {
	{ -- Options which control scope computation
		"echasnovski/mini.indentscope",
		version = false, -- wait till new 0.7.0 release to put it back on semver
		event = "LazyFile",
		opts = {
			draw = {
				-- Delay (in ms) between event and start of drawing scope indicator
				delay = 0,

				-- Animation rule for scope's first drawing. A function which, given
				-- next and total step numbers, returns wait time (in ms). See
				-- |MiniIndentscope.gen_animation| for builtin options. To disable
				animation = require("mini.indentscope").gen_animation.linear({
					easing = "in",
					duration = 8,
					unit = "step",
				}),

				-- Symbol priority. Increase to display on top of more symbols.
				priority = 2,
			},
			options = {
				-- Type of scope's border: which line(s) with smaller indent to
				-- categorize as border. Can be one of: 'both', 'top', 'bottom', 'none'.
				border = "both",

				-- Whether to use cursor column when computing reference indent.
				-- Useful to see incremental scopes with horizontal cursor movements.
				indent_at_cursor = true,

				-- Whether to first check input line to be a border of adjacent scope.
				-- Use it if you want to place cursor on function header to get scope of
				-- its body.
				try_as_border = true,
			},
		},
	},
}
