return {
  "michaelrommel/nvim-silicon",
  event = "BufRead",
  cmd = "Silicon",
  config = function()
    local silicon = require("nvim-silicon")

    silicon.setup({
      background = "#d8a657",
      pad_horiz = 20,
      pad_vert = 20,
      shadow_blur_radius = 0,
      shadow_offset_x = 0,
      shadow_offset_y = 0,
      output = function()
        return "~/Desktop/" .. os.date("!%Y-%m-%dT%H-%M-%SZ") .. "_code.png"
      end,
    })

    local keymap = vim.keymap

    keymap.set(
      { "n", "v" },
      "<leader>mp",
      ":Silicon<CR>",
      { desc = "Copy code screenshot to clipboard" }
    )
  end,
}
