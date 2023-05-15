---@diagnostic disable: undefined-global
local status_ok, neotest = pcall(require, 'neotest')
if not status_ok then return end

neotest.setup {
	adapters = {
		require("neotest-python")({
			dap = { justMyCode = false },
			runner = "unittest",
		}),
		require("neotest-plenary"),
		require("neotest-go"),
		require("neotest-jest"),
		require("neotest-vim-test")({
			ignore_file_types = { "python", "vim", "lua" },
		}),
	},
}
