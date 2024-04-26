-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

lvim.plugins = {
  { "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000
  },
  {
    "sainnhe/gruvbox-material",
    name = "gruvbox",
    priority = 1000
  },
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
      require("hop").setup()
    end,
  },
}

lvim.builtin.telescope.defaults.layout_config.width = 0.8
lvim.builtin.telescope.defaults.layout_config.height = 0.7
lvim.builtin.telescope.defaults.layout_config.preview_width = 0.6
lvim.builtin.telescope.defaults.layout_strategy = "horizontal"

lvim.builtin.which_key.mappings["f"] = {
  name = "Find",
  f = { ":Telescope find_files<CR>", "Find files" },
  g = { ":Telescope git_files<CR>", "Git files" },
  s = { ":Telescope grep_string<CR>", "Grep string" },
  l = { ":Telescope live_grep<CR>", "Live grep" },
  h = { ":HopChar2<CR>", "Hop with 2 chars" },
  H = { ":HopWord<CR>", "Hop to word" },
}

lvim.keys.normal_mode["yp"] = "yyp"
lvim.keys.normal_mode["<C-a>"] = "gg<S-v>G"
lvim.keys.normal_mode["|"] = ":vsplit<CR>"
lvim.keys.normal_mode["-"] = ":split<CR>"
lvim.keys.normal_mode["sc"] = ":close<CR>"

vim.opt.relativenumber = true
vim.opt.wrap = true
vim.opt.textwidth = 120

lvim.colorscheme = "gruvbox-material"
