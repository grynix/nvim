return {
	-- add this to the file where you setup your other plugins:
	{
		"monkoose/neocodeium",
		-- InsertEnter instead of VeryLazy: avoids spawning the codeium server
		-- in sessions where you never enter insert mode
		event = "InsertEnter",
		config = function()
			if os.getenv("USER") == "hu901184" then
				return
			end

			local neocodeium = require("neocodeium")
			neocodeium.setup({
				show_label = false,
				filetypes = { gitignore = false },
				filter = function(bufnr)
					local filename = vim.fs.basename(vim.api.nvim_buf_get_name(bufnr))
					if string.match(filename, "^%.env") then
						return false
					end
					return true
				end,
			})

			vim.keymap.set("i", "<Tab>", neocodeium.accept_line)
			vim.keymap.set("i", "<C-Tab>", neocodeium.accept)
			vim.keymap.set("i", "<S-Tab>", neocodeium.cycle_or_complete)
			vim.keymap.set("i", "<C-j>", neocodeium.accept_word)
		end,
	},
}
