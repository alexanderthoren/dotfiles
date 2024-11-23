return {
  "andythigpen/nvim-coverage",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    auto_reload = true,
    load_coverage_cb = function(ftype)
      vim.notify("Loaded " .. ftype .. " coverage")
    end,
    highlights = {
      covered = { fg = "#a9b665" },
      uncovered = { fg = "#ea6962" },
    },
    lang = {
      python = {
        coverage_file = vim.fn.getcwd() .. "/.coverage",
        coverage_command = vim.fn.getcwd()
          .. "/.venv/bin/coverage json -q -o -",
      },
    },
  },
  keys = {
    {
      "<leader>ncl",
      function()
        require("coverage").load(true)
      end,
      desc = "load coverage report",
    },
    {
      "<leader>ncc",
      function()
        require("coverage").clear()
      end,
      desc = "clear coverage report",
    },
    {
      "<leader>nct",
      function()
        require("coverage").toggle()
      end,
      desc = "toggle coverage signs",
    },
    {
      "<leader>ncs",
      function()
        require("coverage").summary()
      end,
      desc = "show coverage summary",
    },
    {
      "<leader>nc.",
      function()
        require("coverage").jump_next("uncovered")
      end,
      desc = "jump to next uncovered sign",
    },
    {
      "<leader>nc,",
      function()
        require("coverage").jump_prev("uncovered")
      end,
      desc = "jump to prev uncovered sign",
    },
  },
}
