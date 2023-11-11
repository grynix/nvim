return {
	"mfussenegger/nvim-dap",
	dependencies = {
		{
			"mxsdev/nvim-dap-vscode-js",
			-- config = function()
			-- require("dap-vscode-js").setup({
			-- 	debugger_path = vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter",
			-- 	debugger_cmd = { "js-debug-adapter" },
			-- 	adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
			-- })
			-- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
			-- debugger_path = "(runtimedir)/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
			-- debugger_cmd = { "extension" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
			-- adapters = {
			-- 	"chrome",
			-- 	"pwa-node",
			-- 	"pwa-chrome",
			-- 	"pwa-msedge",
			-- 	"node-terminal",
			-- 	"pwa-extensionHost",
			-- 	"node",
			-- 	"chrome",
			-- } -- which adapters to register in nvim-dap
			-- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
			-- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
			-- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
			-- end,
		},
		-- {
		-- 	"microsoft/vscode-js-debug",
		-- 	version = "1.x",
		-- 	build = "npm i && npm run compile vsDebugServerBundle && mv dist out",
		-- },
	},
	opts = function()
		require("dap-vscode-js").setup({
			debugger_path = vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter",
			-- node_path = "/opt/homebrew/bin/node",
			adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost", "chrome" },
		})

		local dap = require("dap")
		dap.adapters["pwa-node"] = {
			type = "server",
			host = "localhost",
			port = 8123,
			executable = {
				command = "js-debug-adapter",
			},
		}

		local js_based_languages = { "typescript", "javascript", "typescriptreact", "javascriptreact" }
		for _, language in ipairs(js_based_languages) do
			dap.configurations[language] = {
				{
					type = "pwa-node",
					request = "launch",
					name = "Launch file",
					program = "${file}",
					cwd = "${workspaceFolder}",
				},
				-- {
				--    type = "pwa-node",
				--    request = "attach",
				--    name = "Attach",
				--    processId = require("dap.utils").pick_process,
				--    cwd = "${workspaceFolder}",
				-- },
				-- {
				--    type = "pwa-chrome",
				--    request = "launch",
				--    name = 'Start Chrome with "localhost"',
				--    url = "http://localhost:3000",
				--    webRoot = "${workspaceFolder}",
				--    userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir",
				-- },
				-- {
				--    type = "pwa-chrome",
				--    name = "Launch Chrome to debug client",
				--    request = "launch",
				--    url = "http://localhost:3000",
				--    sourceMaps = true,
				--    protocol = "inspector",
				--    port = 9222,
				-- },
				-- {
				--    -- For `npm run dev` or `yarn dev`
				--    type = "pwa-node",
				--    request = "launch",
				--    name = "Launch Next.js",
				--    runtimeExecutable = "npm",
				--    runtimeArgs = { "run", "dev" },
				--    -- port = 9229,
				--    skipFiles = { "<node_internals>/**" },
				--    console = "integratedTerminal",
				--    timeout = 40000,
				-- },
				-- {
				--    -- For `npm run dev` or `yarn dev`
				--    type = "pwa-node",
				--    request = "launch",
				--    name = "Launch Next.js",
				--    runtimeExecutable = "npm",
				--    runtimeArgs = { "start" },
				--    port = 9229,
				--    skipFiles = { "<node_internals>/**" },
				--    console = "integratedTerminal",
				--    timeout = 40000,
				-- },
				{
					type = "chrome",
					request = "launch",
					name = "Launch Chrome against localhost:3000",
					url = "http://localhost:3000",
					webRoot = vim.fn.getcwd() .. "/src",
					sourceMaps = true,
				},
			}
		end
		require("dap.ext.vscode").load_launchjs(nil, {})
	end,
}
