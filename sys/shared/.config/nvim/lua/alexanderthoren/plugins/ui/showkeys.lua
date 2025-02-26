local showkeys = {
  "nvzone/showkeys",
  opts = {
    position = "bottom-center",
  },
  keys = {
    { "<leader>mk", ":ShowkeysToggle<CR>", mode = { "n" }, desc = "Show keys" },
  },
}

return showkeys
