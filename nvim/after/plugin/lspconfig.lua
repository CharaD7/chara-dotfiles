---@diagnostic disable: undefined-global
local status_ok, nvim_lsp = pcall(require, 'lspconfig')
if not status_ok then return end

local status_ok_navic, navic = pcall(require, 'nvim-navic')
if not status_ok_navic then return end

local on_attach = function(client, bufnr)
  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
  end
  -- format on save
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("Format", { clear = true }),
      buffer = bufnr,
      callback = function() vim.lsp.buf.formatting_seq_sync() end
    })
  end
end

-- TypeScript
nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" },
}
nvim_lsp.tailwindcss.setup {}
nvim_lsp.cssls.setup {}
nvim_lsp.html.setup {}
nvim_lsp.rust_analyzer.setup {
  assist = {
    importEnforceGranularity = true,
    importPrefix = "crate"
  },
  cargo = {
    allFeatures = true
  },
  checkOnSave = {
    -- default: `cargo check`
    command = "clippy"
  },
}
nvim_lsp.graphql.setup {}
nvim_lsp.black.setup {
  on_attach = on_attach,
  format = { enable = true },
}
nvim_lsp.volar.setup {
  on_attach = on_attach
}
nvim_lsp.jsonls.setup {}
nvim_lsp.dockerls.setup {}
nvim_lsp.zk.setup {}
nvim_lsp.jdtls.setup {
  on_attach = on_attach
}
nvim_lsp.prismals.setup {}
nvim_lsp.solang.setup {
  on_attach = on_attach
}
nvim_lsp.yamlls.setup {}
nvim_lsp.teal_ls.setup {}
nvim_lsp.eslint.setup {
  enable = true,
  format = { enable = true }, -- this will enable formatting
  autoFixOnSave = true,
  codeActionSave = {
    mode = "all",
    -- rules = { "!debugger", "!no-only-tests/*" },
  }
}
