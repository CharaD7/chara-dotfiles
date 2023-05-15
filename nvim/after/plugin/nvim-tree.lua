---@diagnostic disable: undefined-global
local status_ok, nvim_tree = pcall(require, 'nvim-tree')
if not status_ok then return end

nvim_tree.setup {
	disable_netrw = false,
	hijack_netrw = false,
	open_on_setup = false,
	ignore_ft_on_setup = {},
	auto_reload_on_write = true,
	open_on_tab = false,
	hijack_cursor = false,
	update_cwd = true,
	diagnostics = {
		enable = true,
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
		ignore_list = {},
	},
	system_open = {
		cmd = nil,
		args = {},
	},
	git = {
		enable = true,
		ignore = true,
		timeout = 501,
	},
	filters = {
		dotfiles = false,
		custom = {},
	},
	view = {
		width = 31,
		side = "left",
		hide_root_folder = false,
		number = false,
		relativenumber = true,
		signcolumn = "yes",
		mappings = {
			custom_only = false,
			list = {},
		},
	},
	renderer = {
		add_trailing = true,
		group_empty = false,
		highlight_git = false,
		full_name = false,
		highlight_opened_files = "none",
		root_folder_modifier = ":~",
		indent_width = 2,
		indent_markers = {
			enable = true,
			inline_arrows = false,
			icons = {
				corner = "└",
				edge = "│",
				item = "│",
				bottom = "─",
				none = " ",
			},
		},
	},
}
