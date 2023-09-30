---@diagnostic disable: undefined-global
local status_tel_ok, telescope = pcall(require, 'telescope')
if not status_tel_ok then return end

local status_ok, session_lens = pcall(require, 'session-lens')
if not status_ok then return end

telescope.load_extension(session_lens)

session_lens.setup {
  theme = 'ivy',
  theme_config = { bordered = true },
  path_display = { "shorten" },
  previewer = true,
  prompt_title = "CHARA SESSIONS",
}
