local bufferline = {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    options = {
      mode = "tabs",
      separator_style = { " ", " " },
    },
  },
}

return bufferline
