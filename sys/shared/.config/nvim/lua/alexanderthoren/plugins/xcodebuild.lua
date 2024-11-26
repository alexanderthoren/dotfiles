return {
  "wojciech-kulik/xcodebuild.nvim",
  lazy = true,
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
  end,
  keys = {
    {
      "<leader>X",
      ":XcodebuildPicker<CR>",
      mode = { "n" },
      { desc = "Show Xcodebuild Actions" },
    },
    {
      "<leader>xf",
      ":XcodebuildProjectManager<CR>",
      mode = { "n" },
      { desc = "Show Project Manager Actions" },
    },
    {
      "<leader>xb",
      ":XcodebuildBuild<CR>",
      mode = { "n" },
      { desc = "Build Project" },
    },
    {
      "<leader>xB",
      ":XcodebuildBuildForTesting<CR>",
      mode = { "n" },
      { desc = "Build For Testing" },
    },
    {
      "<leader>xr",
      ":XcodebuildBuildRun<CR>",
      mode = { "n" },
      { desc = "Build & Run Project" },
    },
    {
      "<leader>xt",
      ":XcodebuildTest<CR>",
      mode = { "n" },
      { desc = "Run Tests" },
    },
    {
      "<leader>xt",
      ":XcodebuildTestSelected<CR>",
      mode = { "v" },
      { desc = "Run Selected Tests" },
    },
    {
      "<leader>xT",
      ":XcodebuildTestClass<CR>",
      mode = { "n" },
      { desc = "Run Current Test Class" },
    },
    {
      "<leader>x.",
      ":XcodebuildTestRepeat<CR>",
      mode = { "n" },
      { desc = "Repeat Last Test Run" },
    },
    {
      "<leader>xl",
      ":XcodebuildToggleLogs<CR>",
      mode = { "n" },
      { desc = "Toggle Xcodebuild Logs" },
    },
    {
      "<leader>xc",
      ":XcodebuildToggleCodeCoverage<CR>",
      mode = { "n" },
      { desc = "Toggle Code Coverage" },
    },
    {
      "<leader>xC",
      ":XcodebuildShowCodeCoverageReport<CR>",
      mode = { "n" },
      { desc = "Show Code Coverage Report" },
    },
    {
      "<leader>xe",
      ":XcodebuildTestExplorerToggle<CR>",
      mode = { "n" },
      { desc = "Toggle Test Explorer" },
    },
    {
      "<leader>xs",
      ":XcodebuildFailingSnapshots<CR>",
      mode = { "n" },
      { desc = "Show Failing Snapshots" },
    },
    {
      "<leader>xD",
      ":XcodebuildSelectDevice<CR>",
      mode = { "n" },
      { desc = "Select Device" },
    },
    {
      "<leader>xp",
      ":XcodebuildSelectTestPlan<CR>",
      mode = { "n" },
      { desc = "Select Test Plan" },
    },
    {
      "<leader>xx",
      ":XcodebuildQuickfixLine<CR>",
      mode = { "n" },
      { desc = "Quickfix Line" },
    },
    {
      "<leader>xa",
      ":XcodebuildCodeActions<CR>",
      mode = { "n" },
      { desc = "Show Code Actions" },
    },
    {
      "<leader>xS",
      ":XcodebuildBootSimulator<CR>",
      mode = { "n" },
      { desc = "Boot simulator" },
    },

    -- -- Debugging
    -- {
    --   "n",
    --   "<leader>xdd",
    --   dap.build_and_debug,
    --   { desc = "Build & Debug" },
    -- },
    -- {
    --   "n",
    --   "<leader>xdr",
    --   dap.debug_without_build,
    --   { desc = "Debug Without Building" },
    -- },
    -- { "n", "<leader>xdt", dap.debug_tests, { desc = "Debug Tests" } },
    -- {
    --   "n",
    --   "<leader>xdT",
    --   dap.debug_class_tests,
    --   { desc = "Debug Class Tests" },
    -- },
    -- {
    --   "n",
    --   "<leader>xdb",
    --   dap.toggle_breakpoint,
    --   { desc = "Toggle Breakpoint" },
    -- },
    -- {
    --   "n",
    --   "<leader>xdB",
    --   dap.toggle_message_breakpoint,
    --   { desc = "Toggle Message Breakpoint" },
    -- },
    -- {
    --   "n",
    --   "<leader>xdx",
    --   dap.terminate_session,
    --   { desc = "Terminate Debugger" },
    -- },
  },
}
