local dap = require("dap")
require("dapui").setup()

function venv_python_path()
	local cwd = vim.loop.cwd()
	local where = venv_bin_detection("python")
	if where == "python" then
		return "/usr/bin/python"
	end
	return where
end

function venv_bin_detection(tool)
	local cwd = vim.loop.cwd()
	if vim.fn.executable(cwd .. "/.venv/bin/" .. tool) == 1 then
		return cwd .. "/.venv/bin/" .. tool
	end
	return tool
end

local pythonPath = function()
	local cwd = vim.loop.cwd()
	if vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
		return cwd .. "/.venv/bin/python"
	else
		return "/usr/bin/python"
	end
end

local set_python_dap = function()
	require("dap-python").setup() -- earlier, so I can setup the various defaults ready to be replaced
	require("dap-python").resolve_python = function()
		return venv_python_path()
	end
	dap.configurations.python = {
		{
			type = "python",
			request = "launch",
			name = "Launch file",
			program = "${file}",
			pythonPath = venv_python_path(),
		},
		{
			type = "debugpy",
			request = "launch",
			name = "Django",
			program = "${workspaceFolder}/manage.py",
			args = {
				"runserver",
			},
			justMyCode = true,
			django = true,
			console = "integratedTerminal",
			pythonPath = venv_python_path(),
		},
		{
			type = "python",
			request = "attach",
			name = "Attach remote",
			connect = function()
				return {
					host = "localhost",
					port = 5678,
				}
			end,
		},
		{
			type = "python",
			request = "launch",
			name = "Launch file with arguments",
			program = "${file}",
			args = function()
				local args_string = vim.fn.input("Arguments: ")
				return vim.split(args_string, " +")
			end,
			console = "integratedTerminal",
			pythonPath = venv_python_path(),
		},
	}

	dap.adapters.python = {
		type = "executable",
		command = venv_python_path(),
		args = { "-m", "debugpy.adapter" },
	}
end

set_python_dap()
vim.api.nvim_create_autocmd({ "DirChanged", "BufEnter" }, {
	callback = function()
		set_python_dap()
	end,
})
