local lualine = {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status")

    local colors = {
      blue = "#7daea3",
      green = "#a9b665",
      violet = "#d3869b",
      yellow = "#d8a657",
      red = "#ea6962",
      fg = "#ddc7a1",
      bg = "#1b1b1b",
      transparent = nil,
    }

    local my_lualine_theme = {
      normal = {
        a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
        b = { bg = colors.transparent, fg = colors.fg },
        c = { bg = colors.transparent, fg = colors.fg },
      },
      insert = {
        a = { bg = colors.green, fg = colors.bg, gui = "bold" },
        b = { bg = colors.transparent, fg = colors.fg },
        c = { bg = colors.transparent, fg = colors.fg },
      },
      visual = {
        a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
        b = { bg = colors.transparent, fg = colors.fg },
        c = { bg = colors.transparent, fg = colors.fg },
      },
      command = {
        a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
        b = { bg = colors.transparent, fg = colors.fg },
        c = { bg = colors.transparent, fg = colors.fg },
      },
      replace = {
        a = { bg = colors.red, fg = colors.bg, gui = "bold" },
        b = { bg = colors.transparent, fg = colors.fg },
        c = { bg = colors.transparent, fg = colors.fg },
      },
      inactive = {
        a = { bg = colors.transparent, fg = colors.semilightgray, gui = "bold" },
        b = { bg = colors.transparent, fg = colors.semilightgray },
        c = { bg = colors.transparent, fg = colors.semilightgray },
      },
    }

    -- configure lualine with modified theme
    lualine.setup({
      options = {
        theme = my_lualine_theme,
        component_separators = { left = "|", right = "|" },
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = {
          {
            "mode",
            separator = { left = "", right = "" },
            right_padding = 2,
          },
        },
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = colors.red },
          },
          { "encoding" },
          { "fileformat" },
          { "filetype" },
        },
        lualine_z = {
          {
            "location",
            separator = { left = "", right = "" },
            left_padding = 2,
          },
        },
      },
    })
  end,
}

return lualine
