---@diagnostic disable: undefined-global
local status_ok, indent_blankline = pcall(require, 'indent_blankline')
if not status_ok then return end

indent_blankline.setup {
	buftype_exclude = { "terminal", "telescope", "nvim-tree" },
	space_char_blankline = " ",
	show_current_context = true,
	show_end_of_line = true,
	show_current_context_start = true,
	char_highlight_list = {
		"IndentBlanklineIndent2",
		"IndentBlanklineIndent3",
		"IndentBlanklineIndent4",
		"IndentBlanklineIndent5",
		"IndentBlanklineIndent6",
		"IndentBlanklineIndent7",
	},
}
