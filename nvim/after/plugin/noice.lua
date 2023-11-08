local status_ok, noice = pcall(require, 'noice')
if not status_ok then return end

noice.setup {
  lsp = {
    cmdline = {
      enabled = true,
      view = "cmdline_popup",
    },
    hover = {
      enabled = true,
    },
    message = {
      enabled = true,
      view = "notify",
    },
    override = {
      ["vim.lsp.textDocument_hover"] = false,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
    popupmenu = {
      enabled = true,
      backend = "nui"
    },
    preset = {
      bottom_search = true,
      command_pallete = true,
      lsp_doc_border = false
    },
  }
}
