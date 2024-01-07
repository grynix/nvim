return {
	"huynle/ogpt.nvim",
	event = "VeryLazy",

	config = function()
		require("ogpt").setup({
			api_key_cmd = nil,
			yank_register = "+",
			edit_with_instructions = {
				diff = false,
				keymaps = {
					close = "<C-c>",
					accept = "<C-y>",
					toggle_diff = "<C-d>",
					toggle_settings = "<C-o>",
					cycle_windows = "<Tab>",
					use_output_as_input = "<C-i>",
				},
			},
			chat = {
				keymaps = {
					close = { "<C-c>" },
					yank_last = "<C-y>",
					yank_last_code = "<C-k>",
					scroll_up = "<C-u>",
					scroll_down = "<C-d>",
					new_session = "<C-n>",
					cycle_windows = "<Tab>",
					cycle_modes = "<C-f>",
					next_message = "<C-j>",
					prev_message = "<C-k>",
					select_session = "<Space>",
					rename_session = "r",
					delete_session = "d",
					draft_message = "<C-d>",
					edit_message = "e",
					delete_message = "d",
					toggle_settings = "<C-o>",
					toggle_message_role = "<C-r>",
					toggle_system_role_open = "<C-s>",
					stop_generating = "<C-x>",
				},
			},
			popup_layout = {
				default = "center",
				center = {
					width = "80%",
					height = "80%",
				},
				right = {
					width = "30%",
					width_settings_open = "50%",
				},
			},

			settings_window = {
				setting_sign = "  ",
				border = {
					style = "rounded",
					text = {
						top = " Settings ",
					},
				},
				win_options = {
					winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
				},
			},
			openai_params = {
				model = "mistral:7b",
				frequency_penalty = 0,
				presence_penalty = 0,
				-- max_tokens = 300,
				temperature = 0.8,
				top_p = 1,
				-- n = 1,
			},
			openai_edit_params = {
				model = "codellama:13b",
				frequency_penalty = 0,
				presence_penalty = 0,
				temperature = 0,
				top_p = 1,
				-- n = 1,
			},
		})
	end,

	keys = {
		{ "<Leader>Gg", "<cmd>OGPT<CR>", { desc = "ogpt" } },
		{ "<Leader>GG", "<cmd>OGPT<CR>", { desc = "ogpt" } },
		{ "<Leader>Ga", "<cmd>OGPTActAs<CR>", { desc = "ogpt" } },
		{ "<Leader>Gr", "<cmd>OGPTRun<CR>", { desc = "ogpt" } },
	},

	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
}
