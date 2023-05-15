local icons = require "chara.icons"

local function format_diagnostic(diagnostic)
  local icon = icons.diagnostics.Error
  if diagnostic.severity == vim.diagnostic.severity.WARN then
    icon = icons.diagnostics.Warning
  elseif diagnostic.severity == vim.diagnostic.severity.INFO then
    icon = icons.diagnostics.Information
  elseif diagnostic.severity == vim.diagnostic.severity.HINT then
    icon = icons.diagnostics.Hint
  end

  local message = string.format('%s %s', icon, diagnostic.message)
  if diagnostic.code and diagnostic.source then
    message = string.format('%s [%s][%s] %s', icon, diagnostic.source, diagnostic.code, diagnostic.message)
  elseif diagnostic.code or diagnostic.source then
    message = string.format('%s [%s] %s', icon, diagnostic.code or diagnostic.source, diagnostic.message)
  end

  return message .. ' '
end


vim.diagnostic.config({
  code_lens_refresh = true,
  document_highlight = false,
  float = {
    border = 'rounded',
    focusable = true,
    format = format_diagnostic,
    source = 'always',
    style = 'minimal',
  },
  severity_sort = true,
  underline = true,
  update_in_insert = false,
  virtual_text = false,
})
