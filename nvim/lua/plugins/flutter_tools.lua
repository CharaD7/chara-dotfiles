return {
  'akinsho/flutter-tools.nvim',
  lazy = false,
  dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim', -- optional for vim.ui.select
  },
  config = true,
  opts ={
    decorations = {
      statusline = {
        -- Show currently running device if an application is started with a spec: device
        device = true,
      },
    },
    debugger = { -- integrate with nvim dap + install dart code debugger
      enabled = true
    },
    widget_guides = {
      enabled = true,
    },
    dev_tools = {
      autostart = false, -- autostart devtools server if not detected
    },
    lsp = {
      color = {
        enabled = true, -- whether or not to highlight color variables at all
        background = true, -- highlight the background
      },
    },
  },
}
