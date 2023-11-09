local dap = require("dap")
dap.configurations.javascript = {
	{
		-- For `npm run dev` or `yarn dev`
		type = "pwa-node",
		request = "launch",
		name = "Launch Next.js",
		runtimeExecutable = "npm",
		runtimeArgs = { "run", "dev" },
		port = 9229,
		skipFiles = { "<node_internals>/**" },
		console = "integratedTerminal",
		sourceMaps = true,
		protocol = "inspector",
		timeout = 30000,
	},
}
