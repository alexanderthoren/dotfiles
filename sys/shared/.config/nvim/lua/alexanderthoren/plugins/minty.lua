local keymap = vim.keymap

keymap.set("n", "<leader>mh", ":Huefy<cr>", { desc = "Launch Huefy" })
keymap.set("n", "<leader>ms", ":Shades<cr>", { desc = "Launch Shades" })

return {
  "nvzone/minty",
  dependencies = {
    "nvzone/volt",
  },
  cmd = { "Shades", "Huefy" },
}
