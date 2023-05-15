---@diagnostic disable: undefined-global
local status_ok, auto_session = pcall(require, 'auto-session')
if not status_ok then return end

auto_session.setup {
  log_level = "info",
  auto_session_enable_last_session = true,
  auto_session_enabled = true,
  auto_save_enabled = true,
  auto_restore_enabled = true,
  auto_session_suppress_dirs = nil,
}
