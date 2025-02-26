local nvim_dap = {
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
        console = "integratedTerminal",
      },
    }
  end,
  keys = {
    {
      "<leader>db",
      ":DapToggleBreakpoint<CR>",
      mode = { "n" },
      desc = "Toggle breakpoint",
    },
    {
      "<leader>dc",
      ":DapContinue<CR>",
      mode = { "n" },
      desc = "Contine",
    },
    {
      "<leader>di",
      ":DapStepInto<CR>",
      mode = { "n" },
      desc = "Step into",
    },
    {
      "<leader>dj",
      ":DapStepOver<CR>",
      mode = { "n" },
      desc = "Step over",
    },
    {
      "<leader>do",
      ":DapStepOut<CR>",
      mode = { "n" },
      desc = "Step out",
    },
    {
      "<leader>dr",
      ":DapToggleRepl<CR>",
      mode = { "n" },
      desc = "Toggle REPL",
    },
    {
      "<leader>dt",
      ":DapTerminate<CR>",
      mode = { "n" },
      desc = "Terminate",
    },
  },
}

return nvim_dap
