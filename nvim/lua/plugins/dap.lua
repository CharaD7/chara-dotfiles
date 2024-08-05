local js_based_languages = {
  "typescript",
  "javascript",
  "typescriptreact",
  "javascriptreact",
  "vue",
}

return {
  {"nvim-neotest/nvim-nio"},
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local Config = require("lazyvim.config")

      vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

      for name, sign in pairs(Config.icons.dap) do
        sign = type(sign) == "table" and sign or { sign }
        vim.fn.sign_define(
          "Dap" .. name,
          { text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3]}
        )
      end

      for _, language in ipairs(js_based_languages) do
        dap.configurations[language] = {
          -- Debug single nodejs files
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch file",
            program = "${file}",
            cwd = vim.fn.getcwd(),
            sourceMaps = true,
          },
          -- Debug nodejs processes (I need to add --inspect when I run the process)
          {
            type = "pwa-node",
            request = "attach",
            name = "Attach",
            processId = require("dap.utils").pick_process,
            cwd = vim.fn.getcwd(),
            sourceMaps = true,
          },
          -- Debug web applications (client side)
          {
            type = "pwa-chrome",
            request = "launch",
            name = "Launch & Debug Chrome",
            url = function()
              local co = coroutine.running()
              return coroutine.create(function()
                vim.ui.input({
                  prompt = "Enter URL: ",
                  default = "http://localhost:3000",
                },
                  function(url)
                    if url == nil or url == "" then
                      return
                    else
                      coroutine.resume(co, url)
                    end
                  end)
              end)
            end,
            webRoot = vim.fn.getcwd(),
            protocol = "inspector",
            sourceMaps = true,
            userDataDir = false,
          },
          -- Divider for the launch.json derived configs
          {
            name = "----- ⬇️ launch.json configs ⬇️ -----",
            type = "",
            request = "launch",
          },
        }
      end

      local set_python_dap = function()
        require('dap-python').setup() -- earlier, so I can setup the various defaults ready to be replaced
        require('dap-python').resolve_python = function()
          return "venv/bin/python3"
        end
        dap.configurations.python = {
          {
            type = 'python';
            request = 'launch';
            name = "Launch file";
            program = "${file}";
            pythonPath = "venv/bin/python3"
          },
          {
            type = 'debugpy',
            request = 'launch',
            name = 'Django',
            program = '${workspaceFolder}/manage.py',
            args = {
              'runserver',
            },
            justMyCode = true,
            django = true,
            console = "integratedTerminal",
            pythonPath = "venv/bin/python3"
          },
          {
            type = 'python';
            request = 'attach';
            name = 'Attach remote';
            connect = function()
              return {
                host = 'localhost',
                port = 5678
              }
            end;
          },
          {
            type = 'python';
            request = 'launch';
            name = 'Launch file with arguments';
            program = '${file}';
            args = function()
              local args_string = vim.fn.input('Arguments: ')
              return vim.split(args_string, " +")
            end;
            console = "integratedTerminal",
            pythonPath = "venv/bin/python3"
          }
        }

        dap.adapters.python = {
          type = 'executable',
          command = "venv/bin/python3",
          args = {'-m', 'debugpy.adapter'}
        }
      end

      set_python_dap()
      vim.api.nvim_create_autocmd({"DirChanged", "BufEnter"}, {
        callback = function() set_python_dap() end,
      })
    end,

    keys = {
      {
        "<leader>dO",
        function()
          require("dap").step_out()
        end,
        desc = "Step Out",
      },
      {
        "<leader>do",
        function ()
          require("dap").step_over()
        end,
        desc = "Step Over",
      },
      {
        "<leader>da",
        function ()
          if vim.fn.filereadable(".vscode/launch.json") then
            local dap_vscode = require("dap.ext.vscode")
            dap_vscode.load_launchjs(nil, {
              ["pwa-node"] = js_based_languages,
              ["chrome"] = js_based_languages,
              ["pwa-chrome"] = js_based_languages,
            })
          end
          require("dap").continue()
        end,
        desc = "Run with Args",
      },
    },
    dependencies = {
      -- Install the vscode-js-debug adapter
      {
        "microsoft/vscode-js-debug",
        -- After install, build and rename the dist directory to out
        build = "npm install --legacy-peer-deps --no-save && npx gulp vsDebugServerBundle && rm -rf out && mv dist out",
        version = "1.*",
      },
      {
        "mxsdev/nvim-dap-vscode-js",
        config = function()
          require("dap-vscode-js").setup({
            -- Path to vscode-js-debug installation.
            debugger_path = vim.fn.resolve(vim.fn.stdpath("data") .. "/lazy/vscode-js-debug"),

            -- Adapters to register in nvim-dap
            adapters = {
              "chrome",
              "pwa-node",
              "pwa-chrome",
              "pwa-msedge",
              "pwa-extensionHost",
              "node-terminal",
            },
          })
        end,
      },
      {
        "Joakker/lua-json5",
        build = "./install.sh",
      },
    },
  },
}
