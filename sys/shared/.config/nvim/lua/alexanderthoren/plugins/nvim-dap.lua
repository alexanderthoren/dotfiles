return {
  "mfussenegger/nvim-dap",
  dependencies = { "nvim-neotest/nvim-nio" },
  config = function()
    local dap = require("dap")

    dap.adapters.python = function(cb, config)
      if config.request == "attach" then
        ---@diagnostic disable-next-line: undefined-field
        local port = (config.connect or config).port
        ---@diagnostic disable-next-line: undefined-field
        local host = (config.connect or config).host or "127.0.0.1"
        cb({
          type = "server",
          port = assert(
            port,
            "`connect.port` is required for a python `attach` configuration"
          ),
          host = host,
          options = {
            source_filetype = "python",
          },
        })
      else
        cb({
          type = "executable",
          command = os.getenv("DEBUGPY_ROOT") .. "/bin/python",
          args = { "-m", "debugpy.adapter" },
          options = {
            source_filetype = "python",
          },
        })
      end
    end

    dap.configurations.python = {
      {
        -- The first three options are required by nvim-dap
        type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
        request = "launch",
        name = "Launch file",

        -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

        program = "${file}", -- This configuration will launch the current file if used.
        pythonPath = function()
          -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
          -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
          -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
          local cwd = vim.fn.getcwd()
          if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
            return cwd .. "/venv/bin/python"
          elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
            return cwd .. "/.venv/bin/python"
          else
            return "/usr/bin/python"
            -- return os.getenv("PYENV_ROOT") .. "/versions/3.13.0/bin/python"
          end
        end,
      },
    }

    local keymap = vim.keymap

    keymap.set(
      "n",
      "<leader>db",
      ":DapToggleBreakpoint<CR>",
      { desc = "Toggle breakpoint" }
    )
    keymap.set("n", "<leader>dc", ":DapContinue<CR>", { desc = "Contine" })
    keymap.set("n", "<leader>dj", ":DapStepOver<CR>", { desc = "Step over" })
    keymap.set("n", "<leader>di", ":DapStepInto<CR>", { desc = "Step into" })
    keymap.set("n", "<leader>do", ":DapStepOut<CR>", { desc = "Step out" })
    keymap.set(
      "n",
      "<leader>dr",
      ":DapToggleRepl<CR>",
      { desc = "Toggle REPL" }
    )
    keymap.set("n", "<leader>dt", ":DapTerminate<CR>", { desc = "Terminate" })
  end,
}
