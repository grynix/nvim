return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = function()
		local harpoon = require("harpoon")

		harpoon:setup({
			settings = {
				save_on_toggle = true,
				sync_on_ui_close = true,
				key = function()
					return vim.loop.cwd()
				end,
			},

			cmd = {
				add = function(possible_value)
					local idx = vim.fn.line(".")

					local cmd = vim.api.nvim_buf_get_lines(0, idx - 1, idx, false)[1]
					if cmd == nil then
						return nil
					end

					return {
						value = cmd,
						context = { "test" },
					}
				end,

				--- @param list_item {value: any, context: any}
				--- @param option any
				select = function(list_item, list, option)
					vim.cmd(list_item.value)
				end,
			},

			mark = {
				add = function(possible_value)
					local idx = vim.fn.line(".")

					local list_item = vim.api.nvim_buf_get_lines(0, idx - 1, idx, false)[1]
					if list_item == nil then
						return nil
					end

					return {
						value = list_item,
						context = { "test" },
					}
				end,

				--- @param list_item {value: any, context: any}
				--- @param list { ... }
				--- @param option any
				select = function(list_item, list, option)
					local function checkForLineNumbers(str)
						local match = string.find(str, "^%d+ ")
						return match ~= nil
					end

					local function startsWithBracket(str)
						return string.sub(str, 1, 1) == "[" and string.find(str, "]", 1, true) ~= nil
					end

					local function removeBracketContent(str)
						if startsWithBracket(str) then
							return string.gsub(str, "%[.-%]%s?", "", 1)
						else
							return str
						end
					end

					local cmdParam = list_item.value

					if startsWithBracket(cmdParam) then
						cmdParam = removeBracketContent(cmdParam)
					end

					if checkForLineNumbers(cmdParam) then
						vim.cmd("e +0" .. cmdParam)
					else
						vim.cmd("buffer " .. cmdParam)
						print("list_item", list_item)
					end
				end,
			},
		})

		vim.keymap.set("n", "<Leader><CR>", function()
			harpoon:list("mark"):append()
		end)

		vim.keymap.set("n", "<F2>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list("mark"))
		end)

		vim.keymap.set("n", "<F1>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list("cmd"))
		end)
	end,
}
