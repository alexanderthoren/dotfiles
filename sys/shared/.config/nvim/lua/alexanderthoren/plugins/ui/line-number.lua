local line_number = {
  "sethen/line-number-change-mode.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local line_number = require("line-number-change-mode")

    local colors = {
      blue = "#7daea3",
      green = "#a9b665",
      violet = "#d3869b",
      red = "#ea6962",
      fg = "#1b1b1b",
    }

    line_number.setup({
      mode = {
        i = {
          bg = colors.green,
          fg = colors.fg,
          bold = true,
        },
        n = {
          bg = colors.blue,
          fg = colors.fg,
          bold = true,
        },
        R = {
          bg = colors.red,
          fg = colors.fg,
          bold = true,
        },
        v = {
          bg = colors.violet,
          fg = colors.fg,
          bold = true,
        },
        V = {
          bg = colors.violet,
          fg = colors.fg,
          bold = true,
        },
      },
    })
  end,
}

return line_number
