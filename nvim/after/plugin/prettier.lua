---@diagnostic disable: undefined-global
local status_ok, prettier = pcall(require, 'prettier')
if not status_ok then return end

prettier.setup {
	bin = "prettier", -- or `prettierd`
	filetypes = {
		"css",
		"html",
		"graphql",
		"javascript",
		"javascriptreact",
		"json",
		"less",
		"markdown",
		"scss",
		"typescript",
		"typescriptreact",
		"yaml",
		"lua",
		"rust",
	},
	['null-ls'] = {
		condition = function()
			return prettier.config_exists({
				check_package_json = true, -- false will skip checking package.json for prettier key
			})
		end,
		runtime_condition = function(params)
			return true -- false will skip running prettier
		end,
		timeout = 5000,
	},
	cli_options = {
		arrow_parens = "always",
		bracket_spacing = true,
		bracket_same_line = false,
		embedded_language_formatting = "auto",
		end_of_line = "lf", -- for linux
		html_whitespace_sensitivity = "css",
		jsx_single_quote = true,
		print_width = 80,
		prose_wrap = "preserve",
		quote_props = "as-needed",
		semi = true,
		single_attribute_per_line = false,
		single_quote = false,
		tab_width = 2,
		trailing_comma = "es5",
		use_tabs = false,
		vue_indent_script_and_style = false,
	},
}
