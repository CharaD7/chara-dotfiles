return {
  "nvim-neotest/neotest",
  dependencies = { "haydenmeade/neotest-jest", "marilari88/neotest-vitest" },
  keys = {
    {
      "<leader>tl",
      function()
        require("neotest").run.run_last()
      end,
      desc = "Run Last Test",
    }
  },
  opts = function(_, opts)
    table.insert(
      opts.adapters,
      require("neotest-jest")({
        jestCommand = "npm test --",
        jestConfigFile = "customm.jest.config.ts",
        env = { CI = true },
        cwd = function()
          return vim.fn.getcwd()
        end,
      })
    )
    table.insert(opts.adapters, require("neotest-vitest"))
  end,
}
