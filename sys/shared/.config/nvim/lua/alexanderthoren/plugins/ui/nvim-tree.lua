return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local nvimtree = require("nvim-tree")

    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    nvimtree.setup({
      view = {
        width = 50,
        relativenumber = true,
      },
      renderer = {
        indent_markers = {
          enable = true,
        },
        icons = {
          glyphs = {
            folder = {
              arrow_closed = "",
              arrow_open = "",
            },
          },
        },
      },
      actions = {
        open_file = {
          window_picker = {
            enable = true,
          },
        },
      },
      filters = {
        custom = { ".DS_Store" },
      },
      git = {
        ignore = false,
      },
    })

    local keymap = vim.keymap

    keymap.set(
      "n",
      "<leader>ee",
      "<cmd>NvimTreeOpen<CR>",
      { desc = "Open file explorer" }
    )
    keymap.set(
      "n",
      "<leader>ec",
      "<cmd>NvimTreeClose<CR>",
      { desc = "Close file explorer" }
    )
    keymap.set(
      "n",
      "<leader>ef",
      "<cmd>NvimTreeFindFile<CR>",
      { desc = "Find current file in explorer" }
    )
  end,
}
