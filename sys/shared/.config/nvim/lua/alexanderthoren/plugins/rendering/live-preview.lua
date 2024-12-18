return {
  "brianhuster/live-preview.nvim",
  opts = {
    sync_scroll = true,
  },
  keys = {
    { "<leader>ps", "<cmd>LivePreview start<CR>" },
    { "<leader>pc", "<cmd>LivePreview close<CR>" },
  },
}