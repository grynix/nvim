return {
	"stevearc/conform.nvim",
	dependencies = { "mason.nvim" },
	lazy = true,
	cmd = { "ConformInfo" },
	keys = {
		{
			-- Customize or remove this keymap to your liking
			"<leader>cF",
			function()
				require("conform").format({ formatters = { "injected" }, async = true, lsp_fallback = true })
			end,
			mode = { "n", "v" },
			desc = "Format Injected Langs",
		},
	},
	-- Everything in opts will be passed to setup()
	opts = {
		-- Define your formatters
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "autopep8" },
			fish = { "fish_indent" },
			sh = { "shfmt" },
			javascript = { { "prettierd", "prettier" }, "eslint_d" },
			javascriptreact = { { "prettierd", "prettier" }, "eslint_d" },
			typescript = { { "prettierd", "prettier" }, "eslint_d" },
			typescriptreact = { { "prettierd", "prettier" }, "eslint_d" },
			vue = { { "prettierd", "prettier" }, "eslint_d" },
			css = { { "prettierd", "prettier" }, "eslint_d" },
			scss = { { "prettierd", "prettier" }, "eslint_d" },
			less = { { "prettierd", "prettier" }, "eslint_d" },
			html = { { "prettierd", "prettier" }, "eslint_d" },
			json = { { "prettierd", "prettier" }, "eslint_d" },
			jsonc = { { "prettierd", "prettier" }, "eslint_d" },
			yaml = { { "prettierd", "prettier" }, "eslint_d" },
			markdown = { { "prettierd", "prettier" }, "eslint_d" },
			graphql = { { "prettierd", "prettier" }, "eslint_d" },
			handlebars = { { "prettierd", "prettier" }, "eslint_d" },
		},
		-- Customize formatters
		formatters = {
			shfmt = {
				prepend_args = { "-i", "2" },
			},
		},
	},
	-- init = function()
	-- 	-- If you want the formatexpr, here is the place to set it
	-- 	vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	-- end,
}
