return {
  "nvzone/timerly",
  dependencies = {
    "nvzone/volt",
  },
  config = function()
    local keymap = vim.keymap

    keymap.set(
      "n",
      "<leader>p",
      ":TimerlyToggle<cr>",
      { desc = "Toggle timerly" }
    )
  end,
}
