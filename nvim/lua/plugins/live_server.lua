return {
  'barrett-ruth/live-server.nvim',
  build = 'pnpm add -g live-server',
  cmd = { 'LiveServerStart', 'LiveServerStop', 'LiveServerReload' },
  config = true,
  keys = {
    { "<leader>vs", "<cmd>LiveServerStart<cr>", desc = "Start Live Server" },
    { "<leader>vS", "<cmd>LiveServerStop<cr>", desc = "Stop Live Server" },
    { "<leader>vR", "<cmd>LiveServerReload<cr>", desc = "Reload Live Server" }
  },
}
