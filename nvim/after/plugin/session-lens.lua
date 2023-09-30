---@diagnostic disable: undefined-global
local status_ok, session_lens = pcall(require, 'session-lens')
if not status_ok then return end

session_lens.setup {
  theme = 'ivy',
  theme_config = { bordered = true },
  path_display = { "shorten" },
  previewer = true,
  prompt_title = "CHARA SESSIONS",
}
