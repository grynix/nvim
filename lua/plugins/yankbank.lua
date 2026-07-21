-- https://github.com/AckslD/nvim-neoclip.lua
-- if yankbank is not good
return {
	"ptdewey/yankbank-nvim",
	-- VeryLazy (not TextYankPost): yankbank's ungrouped autocmd isn't replayed
	-- by lazy.nvim's event re-trigger, so the loading yank would be lost
	event = "VeryLazy",
	cmd = "YankBank",
	opts = {},
}
