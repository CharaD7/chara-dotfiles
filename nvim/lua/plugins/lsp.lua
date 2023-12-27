return {
  -- Mason
  "williamboman/mason.nvim",
  opts = function(_, opts)
    vim.list_extend(opts.ensure_installed, {
      "stylua",
      "luacheck",
      "shfmt",
      "tailwindcss-language-server",
      "typescript-language-server",
      "css-lsp",
      "shellcheck",
      "vls",
      "clangd",
      "marksman",
      "gopls",
    })
  end,
}
