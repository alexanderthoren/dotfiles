local neoscroll = {
  "karb94/neoscroll.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local neoscroll = require("neoscroll")

    neoscroll.setup({
      mappings = {
        "<C-u>",
        "<C-d>",
        "<C-y>",
        "<C-e>",
        "zt",
        "zz",
        "zb",
      },
      easing = "linear",
    })

    local keymap = {
      ["<C-u>"] = function()
        neoscroll.ctrl_u({ move_cursor = false, duration = 150 })
      end,
      ["<C-d>"] = function()
        neoscroll.ctrl_d({ move_cursor = false, duration = 150 })
      end,
      ["<C-b>"] = function()
        neoscroll.ctrl_b({ move_cursor = false, duration = 450 })
      end,
      ["<C-f>"] = function()
        neoscroll.ctrl_f({ move_cursor = false, duration = 450 })
      end,
      ["<C-y>"] = function()
        neoscroll.scroll(-0.1, { move_cursor = false, duration = 100 })
      end,
      ["<C-e>"] = function()
        neoscroll.scroll(0.1, { move_cursor = false, duration = 100 })
      end,
      ["zt"] = function()
        neoscroll.zt({ half_win_duration = 150 })
      end,
      ["zz"] = function()
        neoscroll.zz({ half_win_duration = 150 })
      end,
      ["zb"] = function()
        neoscroll.zb({ half_win_duration = 150 })
      end,
    }

    local modes = { "n", "v", "x" }

    for key, func in pairs(keymap) do
      vim.keymap.set(modes, key, func)
    end
  end,
}

return neoscroll
