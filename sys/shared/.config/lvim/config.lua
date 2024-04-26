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

lvim.keys.normal_mode["<leader>f"] = false
lvim.keys.normal_mode["<leader>sf"] = false
lvim.keys.normal_mode["<leader>sl"] = false

lvim.keys.normal_mode["yp"] = "yyp"
lvim.keys.normal_mode["<C-a>"] = "gg<S-v>G"
lvim.keys.normal_mode["|"] = ":vsplit<CR>"
lvim.keys.normal_mode["-"] = ":split<CR>"
lvim.keys.normal_mode["sc"] = ":close<CR>"
lvim.keys.normal_mode["sh"] = ":HopChar2<CR>"
lvim.keys.normal_mode["sH"] = ":HopWord<CR>"
lvim.keys.normal_mode["<leader>ff"] = ":Telescope find_files<CR>"
lvim.keys.normal_mode["<leader>fg"] = ":Telescope git_files<CR>"
lvim.keys.normal_mode["<leader>fs"] = ":Telescope grep_string<CR>"
lvim.keys.normal_mode["<leader>fl"] = ":Telescope live_grep<CR>"

vim.opt.relativenumber = true
vim.opt.wrap = true
vim.opt.textwidth = 120

lvim.colorscheme = "gruvbox-material"
