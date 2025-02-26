local trouble = {
  "folke/trouble.nvim",
  dependencies = { "folke/todo-comments.nvim" },
  opts = {},
  cmd = "Trouble",
  keys = {
    {
      "<leader>trd",
      "<cmd>Trouble diagnostics toggle<CR>",
      desc = "Trouble - Diagnostics",
    },
    {
      "<leader>trb",
      "<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
      desc = "Trouble - Buffer diagnostics",
    },
    {
      "<leader>trs",
      "<cmd>Trouble symbols toggle focus=false<CR>",
      desc = "Trouble - Symbols",
    },
    {
      "<leader>trls",
      "<cmd>Trouble lsp toggle focus=false win.position=right<CR>",
      desc = "Trouble - LSP",
    },
    {
      "<leader>trll",
      "<cmd>Trouble loclist toggle<CR>",
      desc = "Trouble - Location list",
    },
    {
      "<leader>trq",
      "<cmd>Trouble qflist toggle<CR>",
      desc = "Trouble - Quickfix list",
    },
  },
}

return trouble
