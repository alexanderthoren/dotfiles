return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/neotest-python",
  },
  config = function()
    local neotest = require("neotest")
    local neotest_python = require("neotest-python")

    ---@diagnostic disable-next-line: missing-fields
    neotest.setup({
      adapters = {
        neotest_python({
          dap = { justMyCode = false },
        }),
      },
    })

    local keymap = vim.keymap

    keymap.set(
      "n",
      "<leader>ncr",
      ":! " .. vim.fn.getcwd() .. "/.venv/bin/coverage run -m pytest<CR>",
      { desc = "Run tests for coverage report", silent = true }
    )

    keymap.set(
      "n",
      "<leader>nr",
      ":Neotest run<CR>",
      { desc = "Run tests in file" }
    )
    keymap.set(
      "n",
      "<leader>ns",
      ":Neotest stop<CR>",
      { desc = "Stop the running tests" }
    )
    keymap.set(
      "n",
      "<leader>nj.",
      ":Neotest jump next<CR>",
      { desc = "Jump to the next test" }
    )
    keymap.set(
      "n",
      "<leader>nj,",
      ":Neotest jump prev<CR>",
      { desc = "Jump to the previous test" }
    )
    keymap.set(
      "n",
      "<leader>no",
      ":Neotest output<CR>",
      { desc = "Show tests results in floating view" }
    )
    keymap.set(
      "n",
      "<leader>np",
      ":Neotest output-panel<CR>",
      { desc = "Show tests results in split view" }
    )
    keymap.set(
      "n",
      "<leader>nn",
      ":Neotest summary<CR>",
      { desc = "Show shummary" }
    )
  end,
}
