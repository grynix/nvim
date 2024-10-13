return {
	"supermaven-inc/supermaven-nvim",
	opts = function()
		require("supermaven-nvim").setup({
			keymaps = {
				accept_suggestion = "<tab>",
				clear_suggestion = "<C-]>",
				accept_word = "<C-j>",
			},
			log_level = "off", -- set to "off" to disable logging completely
		})
	end,
}
