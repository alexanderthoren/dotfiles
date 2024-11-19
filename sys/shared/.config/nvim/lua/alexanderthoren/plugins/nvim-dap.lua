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

    local python_path = require("alexanderthoren.utils").Venv_python_path()
    dap.configurations.python = {
      {
        type = "python",
        request = "launch",
        name = "Launch current file",
        program = "${file}",
        pythonPath = python_path,
        console = "externalTerminal",
      },
      {
        type = "python",
        request = "launch",
        name = "Launch main",
        program = vim.fn.getcwd() .. "/main.py",
        pythonPath = python_path,
        console = "externalTerminal",
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
