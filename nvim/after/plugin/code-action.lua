local status_ok, code_action_menu = pcall(require, "nvim-code-action")
if not status_ok then
  return
end

code_action_menu.setup({})
