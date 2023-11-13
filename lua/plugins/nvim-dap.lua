return {
    {
        'rcarriga/nvim-dap-ui',
        dependencies = {
            'mfussenegger/nvim-dap'
        },
		keys = {
			{'<Leader>db', function()
				require('dapui').setup()
				require('dapui').open()
				end,
				desc="Launch Debugging"
			}
		},
        config = function()
            require('dapui').setup()
			local dap = require('dap')
			dap.adapters.cppdbg = {
				id = 'cppdbg',
				type = 'executable',
				command = 'Z:\\Apps\\vscode-cpptools\\extension\\debugAdapters\\bin\\OpenDebugAD7.exe', -- NOTE: Add path to OpenDebugAD7 as per your system (More info https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#ccrust-via-vscode-cpptools)
				options = {
					detached = false
				}
			}
			dap.configurations.cpp = {
				{
					name = "Launch file",
					type = "cppdbg",
					request = "launch",
					program = function()
						return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
					end,
					cwd = '${workspaceFolder}',
					stopAtEntry = true,
					setupCommands = {
						{
							text = '-enable-pretty-printing',
							description =  'enable pretty printing',
							ignoreFailures = false
						},
					},
				},
				{
					name = 'Attach to gdbserver :1234',
					type = 'cppdbg',
					request = 'launch',
					MIMode = 'gdb',
					miDebuggerServerAddress = 'localhost:1234',
					miDebuggerPath = 'gdb',
					cwd = '${workspaceFolder}',
					program = function()
						return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
					end,
					setupCommands = {
						{
							text = '-enable-pretty-printing',
							description =  'enable pretty printing',
							ignoreFailures = false
						},
					},
				},
			}
			dap.configurations.c = dap.configurations.cpp
			-- keymaps
			vim.keymap.set('n', '<F5>', function() require('dap').continue() end, {desc="Continue"})
    		vim.keymap.set('n', '<F10>', function() require('dap').step_over() end, {desc="Step Over"})
    		vim.keymap.set('n', '<F11>', function() require('dap').step_into() end, {desc="Step Into"})
    		vim.keymap.set('n', '<F12>', function() require('dap').step_out() end, {desc="Step Out"})
    		vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end, {desc="Toggle Breakpoint"})
    		vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end, {desc="Set Breakpoint"})
    		vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, {desc="Set LogPoint"})
    		vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
    		vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
			require('dapui').setup()
			vim.keymap.set('n', '<Leader>db',
				function()
					require('dapui').toggle()
				end,
				{desc = "Debug Sidebar"}
			)
		end,
		lazy = true
    },
}
