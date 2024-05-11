return {
  "mfussenegger/nvim-dap.git",
  dependencies = { "jbyuki/one-small-step-for-vimkind" },
  config = function()
    local dap = require("dap")

    dap.adapters.lua = {
      type = "executable",
    }

    dap.adapters.swift = {
      type = "executable",
    }

    local keymap = vim.keymap

    keymap.set("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>", { desc = "Toggle breakpoint" })
    keymap.set("n", "<leader>dc", "<cmd>DapContinue<CR>", { desc = "Contine" })
    keymap.set("n", "<leader>dj", "<cmd>DapStepOver<CR>", { desc = "Step over" })
    keymap.set("n", "<leader>di", "<cmd>DapStepInto<CR>", { desc = "Step into" })
    keymap.set("n", "<leader>do", "<cmd>DapStepOut<CR>", { desc = "Step out" })
    keymap.set("n", "<leader>dr", "<cmd>DapToggleRepl<CR>", { desc = "Toggle REPL" })
    keymap.set("n", "<leader>dt", "<cmd>DapTerminate<CR>", { desc = "Terminate" })
  end,
}
