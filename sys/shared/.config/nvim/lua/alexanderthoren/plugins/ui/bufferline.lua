return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "BufEnter",
  opts = {
    options = {
      mode = "tabs",
      separator_style = "slant",
    },
  },
}
