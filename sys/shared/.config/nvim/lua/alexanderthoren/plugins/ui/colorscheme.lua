return {
  "sainnhe/gruvbox-material",
  priority = 1000,
  config = function()
    vim.cmd("let g:gruvbox_material_background = 'medium'")
    vim.cmd("let g:gruvbox_material_better_performance = 1")
    vim.cmd("let g:gruvbox_material_transparent_background = 2")
    vim.cmd("colorscheme gruvbox-material")
  end,
}
