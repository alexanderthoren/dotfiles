return {
  "mfussenegger/nvim-dap",
  dependencies = { "nvim-neotest/nvim-nio" },
  config = function()
    local dap = require("dap")

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
