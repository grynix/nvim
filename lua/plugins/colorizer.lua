-- NOTE: setup() is never called, so highlighting only ever activates via the
-- :Colorizer* commands — load on those instead of VeryLazy. If automatic
-- highlighting is wanted, use event = { "BufReadPre", "BufNewFile" } plus
-- config = function() require("colorizer").setup() end instead.
return {
	"norcalli/nvim-colorizer.lua",
	cmd = { "ColorizerToggle", "ColorizerAttachToBuffer", "ColorizerDetachFromBuffer", "ColorizerReloadAllBuffers" },
}
