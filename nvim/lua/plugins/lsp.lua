return {
  -- Mason
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "stylua",
        "shfmt",
        "eslint-lsp",
        "dart-debug-adapter",
        "csharp-language-server",
        "htmx-lsp",
        "rust-analyzer",
        "svelte-language-server",
        "tailwindcss-language-server",
        "typescript-language-server",
        "css-lsp",
        "emmet-ls",
        "shellcheck",
        "vls",
        "clangd",
        "marksman",
        "gopls",
        "prettier",
      })
    end,
  },
  -- LSPconfig
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- make sure mason installs the server
      servers = {
        -- Html
        html = {
          filetpyes = {
            "html",
            "javascript",
            "javascriptreact",
            "javascript.jsx",
            "typescript",
            "typescriptreact",
            "typescript.tsx"
          }
        },
        -- Emmet
        emmet_ls = {
          init_options = {
            html = {
              options = {
                -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
                ["bem.enabled"] = true,
              },
            },
          },
        },
        -- PYTHON
        ruff_lsp = {
          keys = {
            {
              "<leader>oi",
              function ()
                vim.lsp.buf.code_action({
                  apply = true,
                  context = {
                    only = { "source.organizeImports"},
                    diagnostics = {},
                  }
                })
              end,
              desc = "Organize Imports",
            },
          },
        },
        -- CSS
        cssls = {},
        -- eslint
        eslint = {
          settings = {
            -- helps eslint find the eslintrc when it's placed in a subfolder instead of the cwd root
            workingDirectory = { mode = "auto" },
          },
        },
      },
    },
  },
  -- Mason lspconfig
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup()
    end,
  },
  -- Null-ls
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      table.insert(opts.sources, nls.builtins.formatting.prettierd)
    end,
  },
  -- Color picker
  {
    "uga-rosa/ccc.nvim",
    opts = {},
    cmd = {
      "CccPick",
      "CccConvert",
      "CccHighlighterEnable",
      "CccHighlighterDisable",
      "CccHighlighterToggle",
    },
    keys = {
      { "<leader>zp", "<cmd>CccPick<cr>", desc = "Pick" },
      { "<leader>zc", "<cmd>CccConvert<cr>", desc = "Convert" },
      { "<leader>zh", "<cmd>CccHighlighterToggle<cr>", desc = "Toggle Highlighter" },
    },
  },
}
