local status_ok, rt = pcall(require, "rust-tools")
if not status_ok then return end

local codelldb_path = "~/.local/share/nvim/mason/packages/codelldb/extension/adapter/codelldb"
local liblldb_path = "~/.local/share/nvim/mason/packages/codelldb/extension/lldb/bin/lldb-server"

rt.setup({
  dap = {
    adapter = require("rust-tools.dap").get_codelldb_adapter( codelldb_path, liblldb_path ),
  },
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<c-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
  tools = {
    hover_actions = {
      auto_focus = true,
    },
  },
})

