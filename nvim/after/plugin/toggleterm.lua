---@diagnostic disable: undefined-global
local status_ok, toggleterm = pcall(require, 'toggleterm')
if not status_ok then return end

toggleterm.setup {
	autochdir = true,
	direction = 'float', -- could be any of 'vertical' | 'horizontal' | 'tab' | 'float'
	float_opts = {
		border = 'curved',
		winblend = 15
	},
}
