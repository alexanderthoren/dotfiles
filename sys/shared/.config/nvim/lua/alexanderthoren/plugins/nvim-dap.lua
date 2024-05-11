return {
  "mfussenegger/nvim-dap",
  dependencies = {},
  config = function()
    local dap = require("dap")
    local xcodebuild = require("xcodebuild.integrations.dap")

    local codelldbPath = os.getenv("HOME")
      .. "/Users/alexanderthoren/Developer/codelldb-aarch64-darwin/extension/adapter/codelldb"

    xcodebuild.setup(codelldbPath)

    local keymap = vim.keymap

    vim.keymap.set("n", "<leader>dd", xcodebuild.build_and_debug, { desc = "Build & Debug" })
    vim.keymap.set("n", "<leader>dr", xcodebuild.debug_without_build, { desc = "Debug Without Building" })
    vim.keymap.set("n", "<leader>dt", xcodebuild.debug_tests, { desc = "Debug Tests" })
    vim.keymap.set("n", "<leader>dT", xcodebuild.debug_class_tests, { desc = "Debug Class Tests" })
    vim.keymap.set("n", "<leader>b", xcodebuild.toggle_breakpoint, { desc = "Toggle Breakpoint" })
    vim.keymap.set("n", "<leader>B", xcodebuild.toggle_message_breakpoint, { desc = "Toggle Message Breakpoint" })
    vim.keymap.set("n", "<leader>dx", xcodebuild.terminate_session, { desc = "Terminate Debugger" })

    keymap.set("n", "<leader>db", ":DapToggleBreakpoint<CR>", { desc = "Toggle breakpoint" })
    keymap.set("n", "<leader>dc", ":DapContinue<CR>", { desc = "Contine" })
    keymap.set("n", "<leader>dj", ":DapStepOver<CR>", { desc = "Step over" })
    keymap.set("n", "<leader>di", ":DapStepInto<CR>", { desc = "Step into" })
    keymap.set("n", "<leader>do", ":DapStepOut<CR>", { desc = "Step out" })
    keymap.set("n", "<leader>dr", ":DapToggleRepl<CR>", { desc = "Toggle REPL" })
    keymap.set("n", "<leader>dt", ":DapTerminate<CR>", { desc = "Terminate" })
  end,
}
