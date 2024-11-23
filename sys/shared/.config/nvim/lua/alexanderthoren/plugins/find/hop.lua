return {
  "phaazon/hop.nvim",
  event = "BufRead",
  config = function()
    local hop = require("hop")

    hop.setup({})

    local keymap = vim.keymap

    keymap.set(
      "n",
      "<leader>fh",
      ":HopChar2<cr>",
      { desc = "Hop with 2 chars" }
    )
    keymap.set("n", "<leader>fH", ":HopWord<cr>", { desc = "Hop to word" })
  end,
}
