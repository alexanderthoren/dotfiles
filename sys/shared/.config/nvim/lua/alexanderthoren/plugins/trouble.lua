return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
  keys = {
    {
      "<leader>rr",
      "<cmd>TroubleToggle<CR>",
      desc = "Open/close trouble list",
    },
    {
      "<leader>rw",
      "<cmd>TroubleToggle workspace_diagnostics<CR>",
      desc = "Open trouble workspace diagnostics",
    },
    {
      "<leader>rd",
      "<cmd>TroubleToggle document_diagnostics<CR>",
      desc = "Open trouble document diagnostics",
    },
    {
      "<leader>rq",
      "<cmd>TroubleToggle quickfix<CR>",
      desc = "Open trouble quickfix list",
    },
    {
      "<leader>rl",
      "<cmd>TroubleToggle loclist<CR>",
      desc = "Open trouble location list",
    },
    { "<leader>rt", "<cmd>TodoTrouble<CR>", desc = "Open todos in trouble" },
  },
}
