---@diagnostic disable: undefined-global
local status_ok, lspkind = pcall(require, 'lspkind')
if not status_ok then return end

lspkind.init {
  -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
  mode = "symbol",
  preset = "codicons",
  -- finder do lsp request timeout
  -- if your project big enough or your server very slow
  -- you may need to increase this value
  finder_request_timeout = 1500,
}
