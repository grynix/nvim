return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = function()
		local harpoon = require("harpoon")

		harpoon:setup({})

		vim.keymap.set("n", "<Leader><CR>", function()
			harpoon:list():append()
		end)

		vim.keymap.set("n", "<F2>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)

		vim.keymap.set("n", "<Leader>1", function()
			harpoon:list():select(1)
		end)

		vim.keymap.set("n", "<Leader>2", function()
			harpoon:list():select(2)
		end)

		vim.keymap.set("n", "<Leader>3", function()
			harpoon:list():select(3)
		end)

		vim.keymap.set("n", "<Leader>4", function()
			harpoon:list():select(4)
		end)

		-- Toggle previous & next buffers stored within Harpoon list
		vim.keymap.set("n", "<Leader>N", function()
			harpoon:list():prev()
		end)

		vim.keymap.set("n", "<Leader>n", function()
			harpoon:list():next()
		end)
	end,
}
