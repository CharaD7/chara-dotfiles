return {

  -- Lspsaga
  "nvimdev/lspsaga.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons"
  },
  opts = {
    code_action = {
      show_server_name = true,
    },
    ui = {
      border = "rounded",
    },
    outline = {
      win_width = 20,
    },
  },
}
