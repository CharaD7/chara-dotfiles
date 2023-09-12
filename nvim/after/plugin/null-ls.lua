---@diagnostic disable: undefined-global
local status_ok, null_ls = pcall(require, 'null-ls')
if not status_ok then return end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup {
	debug = false,
	sources = {
		formatting.prettier.with {
			extra_filetypes = { 'rust', 'solidity' },
			extra_args = { '--no-semi', '--single-quote', '--jsx-single-quote' }
		},
		diagnostics.fish,
		diagnostics.dotenv_linter,
		diagnostics.flake8,
		diagnostics.editorconfig_checker,
		diagnostics.golangci_lint,
		diagnostics.hadolint, -- for docker linting
		diagnostics.jsonlint,
		diagnostics.teal,
		code_actions.gitsigns,
		code_actions.xo,
	}
}
