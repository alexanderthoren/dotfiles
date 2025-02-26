local xcodebuild = {
  "wojciech-kulik/xcodebuild.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-tree.lua",
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

    local codelldbPath = os.getenv("HOME")
      .. "/Developer/codelldb-aarch64-darwin/extension/adapter/codelldb"
    dap.setup(codelldbPath)

    local keymap = vim.keymap

    --- Xcodebuild
    keymap.set(
      "n",
      "<leader>X",
      ":XcodebuildPicker<CR>",
      { desc = "Show xcodebuild actions" }
    )
    keymap.set(
      "n",
      "<leader>xp",
      ":XcodebuildProjectManager<CR>",
      { desc = "Show project manager actions" }
    )
    keymap.set(
      "n",
      "<leader>xa",
      ":XcodebuildCodeActions<CR>",
      { desc = "Show code actions" }
    )
    --- Build
    keymap.set(
      "n",
      "<leader>xbb",
      ":XcodebuildBuild<CR>",
      { desc = "Build project" }
    )
    keymap.set(
      "n",
      "<leader>xbr",
      ":XcodebuildBuildRun<CR>",
      { desc = "Build & run project" }
    )
    keymap.set(
      "n",
      "<leader>xbt",
      ":XcodebuildBuildForTesting<CR>",
      { desc = "Build for testing" }
    )
    --- Tests
    keymap.set(
      "n",
      "<leader>xtt",
      ":XcodebuildTest<CR>",
      { desc = "Run tests" }
    )
    keymap.set(
      "n",
      "<leader>xte",
      ":XcodebuildTestExplorerToggle<CR>",
      { desc = "Toggle test explorer" }
    )
    keymap.set(
      "v",
      "<leader>xts",
      ":XcodebuildTestSelected<CR>",
      { desc = "Run selected tests" }
    )
    keymap.set(
      "n",
      "<leader>xtc",
      ":XcodebuildTestClass<CR>",
      { desc = "Run current test class" }
    )
    keymap.set(
      "n",
      "<leader>xtr",
      ":XcodebuildTestRepeat<CR>",
      { desc = "Repeat last test run" }
    )
    keymap.set(
      "n",
      "<leader>xtf",
      ":XcodebuildFailingSnapshots<CR>",
      { desc = "Show failing snapshots" }
    )
    --- Logs
    keymap.set(
      "n",
      "<leader>xl",
      ":XcodebuildToggleLogs<CR>",
      { desc = "Toggle logs" }
    )
    --- Coverage
    keymap.set(
      "n",
      "<leader>xcc",
      ":XcodebuildToggleCodeCoverage<CR>",
      { desc = "Toggle coverage" }
    )
    keymap.set(
      "n",
      "<leader>xcr",
      ":XcodebuildShowCodeCoverageReport<CR>",
      { desc = "Show coverage report" }
    )
    --- Simulator
    keymap.set(
      "n",
      "<leader>xsb",
      ":XcodebuildBootSimulator<CR>",
      { desc = "Boot simulator" }
    )
    --- Debugging
    keymap.set(
      "n",
      "<leader>xdr",
      dap.build_and_debug,
      { desc = "Build & debug" }
    )
    keymap.set(
      "n",
      "<leader>xdd",
      dap.debug_without_build,
      { desc = "Debug without building" }
    )
    keymap.set("n", "<leader>xdt", dap.debug_tests, { desc = "Debug tests" })
    keymap.set(
      "n",
      "<leader>xdc",
      dap.debug_class_tests,
      { desc = "Debug class tests" }
    )
    keymap.set(
      "n",
      "<leader>xdb",
      dap.toggle_breakpoint,
      { desc = "Toggle breakpoint" }
    )
    keymap.set(
      "n",
      "<leader>xdB",
      dap.toggle_message_breakpoint,
      { desc = "Toggle message breakpoint" }
    )
    keymap.set(
      "n",
      "<leader>xdx",
      dap.terminate_session,
      { desc = "Terminate debugger" }
    )
  end,
}

return xcodebuild
