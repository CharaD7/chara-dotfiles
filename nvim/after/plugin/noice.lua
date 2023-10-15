local status_ok, noice = pcall(require, 'noice')
if not status_ok then return end

noice.setup {
  lsp = {
    override = {
      ["vim.lsp.textDocument_hover"] = false,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
    hover = {
      enabled = false,
    }
  }
}
