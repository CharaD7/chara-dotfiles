---@diagnostic disable: undefined-global
local status_ok, saga = pcall(require, 'lspsaga')
if not status_ok then return end

local status_ok_notify, notify = pcall(require, 'notify')
if not status_ok_notify then return end

saga.setup {
  code_action = {
    show_server_name = true
  },
  ui = {
    border = 'rounded',
  },
  outline = {
    win_width = 20,
  },
}

notify.setup {}

-- Mappings.
local opts = { silent = true, noremap = true }
local map = vim.keymap.set

-- See `:help vim.lsp.*` for documentation on any of the below functions

local on_attach = function(client, bufnr)
  if client.server_capabilities.document_formatting then
    map("n", "<space>fo", ":lua vim.lsp.buf.formatting()<CR>", opts)
  end
  if client.server_capabilities.document_range_formatting then
    map("v", "<space>fo", ":lua vim.lsp.buf.range_formatting()<CR>", opts)
  end

  local msg = string.format("Language server %s started!", client.name)
  notify(msg, "info", { title = "LSP Notify", timeout = 1001 })
end
