-- https://github.com/AckslD/nvim-neoclip.lua
-- if yankbank is not good
return {
	"ptdewey/yankbank-nvim",
	opts = function()
		require("yankbank").setup()
	end,
}
