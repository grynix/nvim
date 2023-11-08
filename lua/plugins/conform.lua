return {
   "stevearc/conform.nvim",
   event = { "BufWritePre" },
   cmd = { "ConformInfo" },
   keys = {
      {
         -- Customize or remove this keymap to your liking
         "<leader>cF",
         function()
            require("conform").format({ async = true, lsp_fallback = true })
         end,
         mode = "",
         desc = "Format buffer",
      },
   },
   -- Everything in opts will be passed to setup()
   opts = {
      -- Define your formatters
      formatters_by_ft = {
         lua = { "stylua" },
         fish = { "fish_indent" },
         sh = { "shfmt" },
         javascript = { { "prettierd", "prettier" } },
         javascriptreact = { { "prettierd", "prettier" } },
         typescript = { { "prettierd", "prettier" } },
         typescriptreact = { { "prettierd", "prettier" } },
         vue = { { "prettierd", "prettier" } },
         css = { { "prettierd", "prettier" } },
         scss = { { "prettierd", "prettier" } },
         less = { { "prettierd", "prettier" } },
         html = { { "prettierd", "prettier" } },
         json = { { "prettierd", "prettier" } },
         jsonc = { { "prettierd", "prettier" } },
         yaml = { { "prettierd", "prettier" } },
         markdown = { { "prettierd", "prettier" } },
         graphql = { { "prettierd", "prettier" } },
         handlebars = { { "prettierd", "prettier" } },
      },
      -- Set up format-on-save
      format_on_save = { timeout_ms = 500, lsp_fallback = true },
      -- Customize formatters
      formatters = {
         shfmt = {
            prepend_args = { "-i", "2" },
         },
      },
   },
   init = function()
      -- If you want the formatexpr, here is the place to set it
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
   end,
}
