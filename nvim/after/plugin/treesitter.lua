---@diagnostic disable: undefined-global
local status_ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not status_ok then return end

-- local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
-- parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }

treesitter.setup {
	autopairs = { enable = true },
	ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	sync_install = true,
	highlight = { enable = true },
	rainbow = { enable = true, extended_mode = true },
	indent = { enable = true },
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
	autotag = { enable = true, },
	refactor = { highlight_definitions = { enable = true } },
	playground = { enable = true },
}
