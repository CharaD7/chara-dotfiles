---@diagnostic disable: undefined-global
local status_ok, transparent = pcall(require, 'transparent')
if not status_ok then return end

transparent.setup {
	extra_groups = { "all" },
}
