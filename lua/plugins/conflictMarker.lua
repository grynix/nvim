-- NOTE: this previously used a packer-style `setup` key (ignored by lazy.nvim)
-- targeting a Lua API this vimscript plugin doesn't have, so the plugin never
-- loaded at all. It ships its own co/ct/cb/cn mappings and highlighting.
return {
	"rhysd/conflict-marker.vim",
	event = { "BufReadPost", "BufNewFile" },
}
