local codecompanion = {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    strategies = {
      chat = {
        adapter = "copilot",
      },
    },
    opts = {
      log_level = "DEBUG",
    },
    adapters = {
      copilot = function()
        return require("codecompanion.adapters").extend("copilot", {
          schema = {
            model = {
              default = "claude-3.5-sonnet",
            },
          },
        })
      end,
    },
  },
  keys = {
    {
      "<leader>ca",
      ":CodeCompanionActions<cr>",
      mode = { "n" },
      desc = "Toggle CodeCompanion actions",
    },
    {
      "<leader>ci",
      ":CodeCompanion<cr>",
      mode = { "n" },
      desc = "Toggle CodeCompanion inline",
    },
    {
      "<leader>cc",
      ":CodeCompanionChat<cr>",
      mode = { "n" },
      desc = "Toggle CodeCompanion chat",
    },
  },
}

return codecompanion
