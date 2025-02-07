return {
	"stevearc/conform.nvim",
	dependencies = { "mason.nvim" },
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
			go = { "gofumpt", "gofmt", stop_after_first = true },
			javascript = {
				"prettierd",
				"prettier",
				stop_after_first = true,
				-- { "eslint_d", "eslint", stop_after_first = true },
			},
			javascriptreact = {
				"prettierd",
				"prettier",
				stop_after_first = true,
				-- { "eslint_d", "eslint", stop_after_first = true },
			},
			typescript = {
				"prettierd",
				"prettier",
				stop_after_first = true,
				-- { "eslint_d", "eslint", stop_after_first = true },
			},
			typescriptreact = {
				"prettierd",
				"prettier",
				stop_after_first = true,
				-- { "eslint_d", "eslint", stop_after_first = true },
			},
			-- vue = { { "prettierd", "prettier" }, { "eslint_d", "eslint" } },
			-- css = { { "prettierd", "prettier" }, { "eslint_d", "eslint" } },
			-- scss = { { "prettierd", "prettier" }, { "eslint_d", "eslint" } },
			-- less = { { "prettierd", "prettier" }, { "eslint_d", "eslint" } },
			-- html = { { "prettierd", "prettier" }, { "eslint_d", "eslint" } },
			-- json = { { "prettierd", "prettier" }, { "eslint_d", "eslint" } },
			-- jsonc = { { "prettierd", "prettier" }, { "eslint_d", "eslint" } },
			-- yaml = { { "prettierd", "prettier" }, { "eslint_d", "eslint" } },
			-- markdown = { { "prettierd", "prettier" }, { "eslint_d", "eslint" } },
			-- graphql = { { "prettierd", "prettier" }, { "eslint_d", "eslint" } },
			-- handlebars = { { "prettierd", "prettier" }, { "eslint_d", "eslint" } },
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
