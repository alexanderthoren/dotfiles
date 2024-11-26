return {
  "oskarrrrrrr/symbols.nvim",
  config = function()
    local r = require("symbols.recipes")
    require("symbols").setup(r.DefaultFilters, r.AsciiSymbols, {
      sidebar = {
        open_direction = "right",
      },
      auto_resize = {
        enabled = false,
        min_width = 80,
        max_width = 80,
      },
      fixed_width = 100,
      auto_peek = false,
    })
  end,
  keys = {
    {
      "<leader>oo",
      ": Symbols<CR>",
      mode = { "n" },
      desc = "Open Symbols",
    },
    {
      "<leader>oc",
      ": SymbolsClose<CR>",
      mode = { "n" },
      desc = "Close Symbols",
    },
  },
}
