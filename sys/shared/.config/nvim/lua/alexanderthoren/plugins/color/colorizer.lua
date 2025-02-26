local colorizer = {
  "norcalli/nvim-colorizer.lua",
  event = "BufEnter",
  config = function()
    local colorizer = require("colorizer")

    colorizer.setup({})

    vim.cmd("autocmd! BufRead * :ColorizerAttachToBuffer")
  end,
}

return colorizer
