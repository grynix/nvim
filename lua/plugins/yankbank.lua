-- https://github.com/AckslD/nvim-neoclip.lua
-- if yankbank is not good
return {
	"ptdewey/yankbank-nvim",
	config = function()
		require("yankbank").setup()
	end,
}
