local dap = require('dap')

dap.set_log_level('DEBUG')

dap.adapters.node = {
	type = 'executable',
	command = 'node',
	args = {vim.fn.stdpath('data') .. '/dapinstall/jsnode_dbg/vscode-node-debug2/out/src/nodeDebug.js'},
}

-- require('dap.ext.vscode').load_launchjs()

dap.configurations.javascript = {
	{
		type = 'node',
		request = 'attach',
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = 'inspector',
		skipFiles = {'<node_internals>/**/*.js'},
	},
}

print(vim.fn.getcwd())

dap.configurations.typescript = {
	{
		type = 'node',
		name = 'Server',
		request = 'attach',
		port = 9209,
		remoteRoot = "/home/node/app",
		localRoot = vim.fn.getcwd(),
		restart = true,
		sourceMaps = true,
		smartStep = true,
		outFiles = { vim.fn.getcwd() .. "/dist" },
		trace = true,

		-- cwd = vim.fn.getcwd(),
		-- protocol = 'inspector',
		-- skipFiles = {'<node_internals>/**/*.js'},
	},
}
