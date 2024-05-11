return {
  "wojciech-kulik/xcodebuild.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-tree.lua",
    -- "stevearc/oil.nvim", -- (optional) to manage project files
    "nvim-treesitter/nvim-treesitter",
    "mfussenegger/nvim-dap",
  },
  config = function()
    local xcodebuild = require("xcodebuild")
    local dap = require("xcodebuild.integrations.dap")

    xcodebuild.setup({
      code_coverage = {
        enabled = true,
      },
    })

    local codelldbPath = os.getenv("HOME") .. "/Developer/codelldb-aarch64-darwin/extension/adapter/codelldb"
    local lldbdap = "/opt/homebrew/opt/llvm/bin/lldb-dap"
    dap.setup(lldbdap)

    local keymap = vim.keymap

    keymap.set("n", "<leader>X", ":XcodebuildPicker<CR>", { desc = "Show Xcodebuild Actions" })
    keymap.set("n", "<leader>xf", ":XcodebuildProjectManager<CR>", { desc = "Show Project Manager Actions" })
    keymap.set("n", "<leader>xb", ":XcodebuildBuild<CR>", { desc = "Build Project" })
    keymap.set("n", "<leader>xB", ":XcodebuildBuildForTesting<CR>", { desc = "Build For Testing" })
    keymap.set("n", "<leader>xr", ":XcodebuildBuildRun<CR>", { desc = "Build & Run Project" })
    keymap.set("n", "<leader>xt", ":XcodebuildTest<CR>", { desc = "Run Tests" })
    keymap.set("v", "<leader>xt", ":XcodebuildTestSelected<CR>", { desc = "Run Selected Tests" })
    keymap.set("n", "<leader>xT", ":XcodebuildTestClass<CR>", { desc = "Run Current Test Class" })
    keymap.set("n", "<leader>x.", ":XcodebuildTestRepeat<CR>", { desc = "Repeat Last Test Run" })
    keymap.set("n", "<leader>xl", ":XcodebuildToggleLogs<CR>", { desc = "Toggle Xcodebuild Logs" })
    keymap.set("n", "<leader>xc", ":XcodebuildToggleCodeCoverage<CR>", { desc = "Toggle Code Coverage" })
    keymap.set("n", "<leader>xC", ":XcodebuildShowCodeCoverageReport<CR>", { desc = "Show Code Coverage Report" })
    keymap.set("n", "<leader>xe", ":XcodebuildTestExplorerToggle<CR>", { desc = "Toggle Test Explorer" })
    keymap.set("n", "<leader>xs", ":XcodebuildFailingSnapshots<CR>", { desc = "Show Failing Snapshots" })
    keymap.set("n", "<leader>xD", ":XcodebuildSelectDevice<CR>", { desc = "Select Device" })
    keymap.set("n", "<leader>xp", ":XcodebuildSelectTestPlan<CR>", { desc = "Select Test Plan" })
    keymap.set("n", "<leader>xq", ":Telescope quickfix<CR>", { desc = "Show QuickFix List" })
    keymap.set("n", "<leader>xx", ":XcodebuildQuickfixLine<CR>", { desc = "Quickfix Line" })
    keymap.set("n", "<leader>xa", ":XcodebuildCodeActions<CR>", { desc = "Show Code Actions" })

    keymap.set("n", "<leader>xdd", dap.build_and_debug, { desc = "Build & Debug" })
    keymap.set("n", "<leader>xdr", dap.debug_without_build, { desc = "Debug Without Building" })
    keymap.set("n", "<leader>xdt", dap.debug_tests, { desc = "Debug Tests" })
    keymap.set("n", "<leader>xdT", dap.debug_class_tests, { desc = "Debug Class Tests" })
    keymap.set("n", "<leader>xdb", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
    keymap.set("n", "<leader>xdB", dap.toggle_message_breakpoint, { desc = "Toggle Message Breakpoint" })
    keymap.set("n", "<leader>xdx", dap.terminate_session, { desc = "Terminate Debugger" })
  end,
}
