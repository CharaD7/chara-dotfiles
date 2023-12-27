return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "astro",
      "cmake",
      "css",
      "fish",
      "gitignore",
      "go",
      "http",
      "rust",
      "scss",
      "typescript",
      "svelte",
      "solidity",
      "python",
      "lua",
      "json",
      "vim",
      "vue"
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)

    -- MDX
    vim.filetype.add({
      extension = {
        mdx = "mdx",
      }
    })
    vim.treesitter.language.register("markdown", "mdx")
  end
}
