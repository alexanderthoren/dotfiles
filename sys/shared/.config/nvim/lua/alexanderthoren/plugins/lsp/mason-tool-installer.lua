local mason_tool_installer = {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  dependencies = {
    "williamboman/mason.nvim",
  },
  config = function()
    local mason_tool_installer = require("mason-tool-installer")

    mason_tool_installer.setup({
      ensure_installed = {
        "luacheck",
        "prettier",
        "stylua",
        "bashls",
        "shfmt",
        "shellcheck",
        "ruff",
        "pyright",
        "ruby_lsp",
        "rubocop",
        "zls",
      },
    })
  end,
}

return mason_tool_installer
