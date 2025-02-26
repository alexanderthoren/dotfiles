local render_markdown = {
  "MeanderingProgrammer/markdown.nvim",
  name = "render-markdown",
  ft = "markdown",
  lazy = true,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local render_markdown = require("render-markdown")
    render_markdown.setup({
      file_types = { "markdown", "copilot-chat" },
    })
  end,
}

return render_markdown
